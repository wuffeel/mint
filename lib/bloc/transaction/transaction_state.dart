part of 'transaction_bloc.dart';

@immutable
abstract class TransactionState {}

class TransactionInitial extends TransactionState {}

class TransactionPayLoading extends TransactionState {}

class TransactionPaySuccess extends TransactionState {}

class TransactionPayFailure extends TransactionState {}
