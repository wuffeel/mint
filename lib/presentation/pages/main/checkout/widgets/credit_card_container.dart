import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/checkout/widgets/mastercard_container.dart';
import 'package:mint/presentation/widgets/undefined_credit_card_icon.dart';
import 'package:mint/theme/mint_text_styles.dart';
import 'package:mint/utils/credit_card_utils.dart';
import 'package:mint_core/mint_utils.dart';

import '../../../../../gen/assets.gen.dart';

class CreditCardContainer extends StatelessWidget {
  const CreditCardContainer({
    super.key,
    required this.isSelected,
    required this.cardLast4,
    required this.brand,
  });

  final String cardLast4;
  final String brand;
  final bool isSelected;

  Color _getUnselectedColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? MintColors.grey1
        : MintColors.greyLight.withOpacity(0.3);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cardIcon = CreditCardUtils.getCardIconByBrand(brand);
    return Container(
      width: 127.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          strokeAlign: BorderSide.strokeAlignOutside,
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).brightness == Brightness.dark
                  ? MintColors.separatorDark.withOpacity(0.65)
                  : MintColors.pinGreyLight,
        ),
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.secondary,
      ),
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (cardIcon != null && cardIcon == Assets.svg.mastercardIcon)
            MastercardContainer(isSelected: isSelected)
          else if (cardIcon != null)
            cardIcon.svg(
              colorFilter: ColorFilter.mode(
                isSelected ? Colors.white : _getUnselectedColor(context),
                BlendMode.srcIn,
              ),
            )
          else
            UndefinedCreditCardIcon(
              width: 17.w,
              height: 17.h,
              color: isSelected ? Colors.white : _getUnselectedColor(context),
            ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                l10n.creditCard,
                style: MintTextStyles.buttonsHuge.copyWith(
                  color: isSelected
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ...List.generate(
                    4,
                    (index) => SizedBox(
                      width: 5.w,
                      height: 5.h,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected
                              ? MintColors.slightlyBlue
                              : _getUnselectedColor(context),
                        ),
                      ),
                    ),
                  )..insertBetween(SizedBox(width: 3.w)),
                  SizedBox(width: 8.w),
                  Text(
                    cardLast4,
                    style: MintTextStyles.caption10.copyWith(
                      color: isSelected
                          ? MintColors.slightlyBlue
                          : _getUnselectedColor(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
