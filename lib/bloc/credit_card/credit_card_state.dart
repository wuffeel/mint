part of 'credit_card_bloc.dart';

@immutable
abstract class CreditCardState {}

class CreditCardInitial extends CreditCardState {}

class CreditCardListFetchLoading extends CreditCardState {}

class CreditCardListFetchSuccess extends CreditCardState {
  CreditCardListFetchSuccess({this.cardList = const []});

  final List<CreditCardModel> cardList;
}

class CreditCardListFetchFailure extends CreditCardState {}

class CreditCardSaveLoading extends CreditCardListFetchSuccess {
  CreditCardSaveLoading({required super.cardList});
}

class CreditCardSaveSuccess extends CreditCardListFetchSuccess {
  CreditCardSaveSuccess({required super.cardList});
}

class CreditCardSaveFailure extends CreditCardListFetchSuccess {
  CreditCardSaveFailure({required super.cardList});
}

class CreditCardSaveDuplicateFailure extends CreditCardSaveFailure {
  CreditCardSaveDuplicateFailure({required super.cardList});
}

class CreditCardDeleteSuccess extends CreditCardListFetchSuccess {
  CreditCardDeleteSuccess({required super.cardList});
}

class CreditCardDeleteLoading extends CreditCardListFetchSuccess {
  CreditCardDeleteLoading(this.cardId, {required super.cardList});

  final String cardId;
}

class CreditCardDeleteFailure extends CreditCardListFetchSuccess {
  CreditCardDeleteFailure({required super.cardList});
}
