import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/usecase/credit_card_delete_use_case.dart';
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
    this._creditCardListFetchUseCase,
    this._creditCardSaveUseCase,
    this._creditCardDeleteUseCase,
    this._userController,
  ) : super(CreditCardInitial()) {
    _subscribeToUserChange();
    on<CreditCardListFetchRequested>(_onCardListFetch);
    on<CreditCardSaveRequested>(_onCreditCardSave);
    on<CreditCardDeleteRequested>(_onCreditCardDelete);
  }

  final CreditCardListFetchUseCase _creditCardListFetchUseCase;
  final CreditCardSaveUseCase _creditCardSaveUseCase;
  final CreditCardDeleteUseCase _creditCardDeleteUseCase;

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

      // Check if current cardList has the same databaseCard received
      final isDuplicate = state.cardList.any((e) {
        return e.fingerprint == databaseCard.fingerprint &&
            e.expirationMonth == databaseCard.expirationMonth &&
            e.expirationYear == databaseCard.expirationYear;
      });

      // databaseCard can be not attached to customer, need to check
      // if there is local credit card duplicate
      if (!event.isSaveForFuture) {
        if (isDuplicate) {
          emit(CreditCardSaveDuplicateFailure(cardList: state.cardList));
          return;
        }
      }

      // Check if there is local credit card with same number, but different
      // expiration data. If so, need to locally replace it with new card data
      final updatedList = state.cardList
          .map((e) {
            final expirationChanged =
                e.fingerprint == databaseCard.fingerprint &&
                    (e.expirationMonth != databaseCard.expirationMonth ||
                        e.expirationYear != databaseCard.expirationYear);
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
      if (error.toString().contains('already-exists')) {
        emit(CreditCardSaveDuplicateFailure(cardList: state.cardList));
      } else {
        log('CreditCardSaveFailure: $error');
        emit(CreditCardSaveFailure(cardList: state.cardList));
      }
    }
  }

  Future<void> _onCreditCardDelete(
    CreditCardDeleteRequested event,
    Emitter<CreditCardState> emit,
  ) async {
    final state = this.state;
    if (state is! CreditCardListFetchSuccess) return;

    final cardId = event.paymentMethodId;

    try {
      emit(CreditCardDeleteLoading(cardId, cardList: state.cardList));
      await _creditCardDeleteUseCase(cardId);
      emit(
        CreditCardDeleteSuccess(
          cardList: state.cardList..removeWhere((card) => card.id == cardId),
        ),
      );
    } catch (error) {
      log('CreditCardDeleteFailure: $error');
      emit(CreditCardDeleteFailure(cardList: state.cardList));
    }
  }
}
