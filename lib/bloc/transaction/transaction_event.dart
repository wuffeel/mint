part of 'transaction_bloc.dart';

@immutable
abstract class TransactionEvent {}

class TransactionPayRequested extends TransactionEvent {
  TransactionPayRequested(this.bookingId, this.specialistId, this.price);

  final String bookingId;
  final String specialistId;
  final int price;
}
