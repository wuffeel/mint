part of 'credit_card_bloc.dart';

@immutable
abstract class CreditCardEvent {}

class CreditCardListFetchRequested extends CreditCardEvent {}

class CreditCardSaveRequested extends CreditCardEvent {
  CreditCardSaveRequested({required this.isSaveForFuture});

  final bool isSaveForFuture;
}

class CreditCardDeleteRequested extends CreditCardEvent {
  CreditCardDeleteRequested(this.paymentMethodId);

  final String paymentMethodId;
}
