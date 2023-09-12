import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/entity/transaction_data/transaction_data.dart';
import 'package:mint/domain/usecase/transaction_pay_use_case.dart';
import 'package:mint_core/mint_bloc.dart';
import 'package:mint_core/mint_core.dart';

part 'transaction_event.dart';

part 'transaction_state.dart';

@injectable
class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc(
    this._transactionPayUseCase,
    this._userController,
  ) : super(TransactionInitial()) {
    _subscribeToUserChange();
    on<TransactionPayRequested>(_onPayRequest);
  }

  final TransactionPayUseCase _transactionPayUseCase;

  PatientUser? _currentUser;
  final UserController<PatientUser?> _userController;

  late final StreamSubscription<PatientUser?> _userSubscription;

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

  Future<void> _onPayRequest(
    TransactionPayRequested event,
    Emitter<TransactionState> emit,
  ) async {
    final user = _currentUser;
    if (user == null) return;
    try {
      emit(TransactionPayLoading());
      final transactionData = TransactionData(
        bookingId: event.bookingId,
        specialistId: event.specialistId,
        userId: user.id,
        paymentMethodId: event.paymentMethodId,
        amount: event.amount,
      );
      await _transactionPayUseCase(transactionData);
      emit(TransactionPaySuccess());
    } catch (error) {
      log('TransactionPayFailure: $error');
      emit(TransactionPayFailure());
    }
  }
}
