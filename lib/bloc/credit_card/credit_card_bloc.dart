import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/usecase/credit_card_list_fetch_use_case.dart';
import 'package:mint/domain/usecase/credit_card_save_use_case.dart';

import '../../domain/controller/user_controller.dart';
import '../../domain/entity/credit_card_model/credit_card_model.dart';
import '../../domain/entity/user_model/user_model.dart';

part 'credit_card_event.dart';

part 'credit_card_state.dart';

@injectable
class CreditCardBloc extends Bloc<CreditCardEvent, CreditCardState> {
  CreditCardBloc(
    this._creditCardSaveUseCase,
    this._creditCardListFetchUseCase,
    this._userController,
  ) : super(CreditCardInitial()) {
    _subscribeToUserChange();
    on<CreditCardListFetchRequested>(_onCardListFetch);
    on<CreditCardSaveRequested>(_onCreditCardSave);
  }

  final CreditCardSaveUseCase _creditCardSaveUseCase;
  final CreditCardListFetchUseCase _creditCardListFetchUseCase;

  UserModel? _currentUser;
  final UserController _userController;

  late final StreamSubscription<UserModel?> _userSubscription;

  void _subscribeToUserChange() {
    _userSubscription = _userController.user.listen((user) {
      _currentUser = user;
    });
  }

  @override
  Future<void> close() async {
    await _userSubscription.cancel();
    return super.close();
  }

  Future<void> _onCardListFetch(
    CreditCardListFetchRequested event,
    Emitter<CreditCardState> emit,
  ) async {
    final user = _currentUser;
    if (user == null) return;
    try {
      emit(CreditCardListFetchLoading());
      final cardList = await _creditCardListFetchUseCase(user.id);
      emit(CreditCardListFetchSuccess(cardList: cardList));
    } catch (error) {
      log('CreditCardListFetchFailure: $error');
      emit(CreditCardListFetchFailure());
    }
  }

  Future<void> _onCreditCardSave(
    CreditCardSaveRequested event,
    Emitter<CreditCardState> emit,
  ) async {
    final state = this.state;
    final user = _currentUser;
    if (user == null || state is! CreditCardListFetchSuccess) return;

    try {
      emit(CreditCardSaveLoading(cardList: state.cardList));
      final databaseCard = await _creditCardSaveUseCase(
        user.id,
        isSaveForFuture: event.isSaveForFuture,
      );

      final isDuplicate = state.cardList.any((e) {
        return e.fingerprint == databaseCard.fingerprint &&
            e.expirationMonth == databaseCard.expirationMonth &&
            e.expirationYear == databaseCard.expirationYear;
      });
      if (!event.isSaveForFuture) {
        if (isDuplicate) {
          emit(CreditCardSaveDuplicateFailure(cardList: state.cardList));
          return;
        }
      }

      final updatedList = state.cardList
          .map((e) {
            final expirationChanged =
                e.fingerprint == databaseCard.fingerprint &&
                        e.expirationMonth != databaseCard.expirationMonth ||
                    e.expirationYear != databaseCard.expirationYear;
            final duplicate = e.fingerprint == databaseCard.fingerprint &&
                e.expirationMonth == databaseCard.expirationMonth &&
                e.expirationYear == databaseCard.expirationYear;
            if (expirationChanged || duplicate) {
              return null;
            }
            return e;
          })
          .whereType<CreditCardModel>()
          .toList();

      emit(CreditCardSaveSuccess(cardList: [databaseCard, ...updatedList]));
    } catch (error) {
      log('CreditCardSaveFailure: $error');
      if (error.toString().contains('already-exists')) {
        emit(CreditCardSaveDuplicateFailure(cardList: state.cardList));
      } else {
        emit(CreditCardSaveFailure(cardList: state.cardList));
      }
    }
  }
}
