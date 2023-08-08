part of 'transaction_bloc.dart';

@immutable
abstract class TransactionEvent {}

class TransactionPayRequested extends TransactionEvent {
  TransactionPayRequested({
    required this.bookingId,
    required this.specialistId,
    required this.paymentMethodId,
    required this.amount,
  });

  final String bookingId;
  final String specialistId;
  final String paymentMethodId;
  final int amount;
}
