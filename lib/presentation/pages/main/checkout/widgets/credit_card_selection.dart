import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/domain/entity/credit_card_model/credit_card_model.dart';
import 'package:mint/presentation/pages/main/checkout/widgets/credit_card_container.dart';

class CreditCardSelection extends StatelessWidget {
  const CreditCardSelection({
    super.key,
    required this.cards,
    required this.selectedCard,
    required this.onSelect,
    required this.itemCount,
  });

  final List<CreditCardModel> cards;
  final CreditCardModel? selectedCard;
  final void Function(CreditCardModel) onSelect;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemCount == 0 ? 0 : 126.h,
      child: ListView.separated(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () => onSelect(cards[index]),
          child: CreditCardContainer(
            isSelected: cards[index] == selectedCard,
            cardLast4: cards[index].last4,
            brand: cards[index].cardBrand,
          ),
        ),
        separatorBuilder: (_, __) => SizedBox(width: 16.w),
        itemCount: itemCount,
      ),
    );
  }
}
