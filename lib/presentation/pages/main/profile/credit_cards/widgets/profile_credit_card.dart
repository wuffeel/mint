import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/presentation/widgets/undefined_credit_card_icon.dart';
import 'package:mint/theme/mint_text_styles.dart';
import 'package:mint/utils/credit_card_utils.dart';

class ProfileCreditCard extends StatelessWidget {
  const ProfileCreditCard({
    super.key,
    required this.id,
    required this.brand,
    required this.last4,
    required this.onDelete,
  });

  final String id;
  final String brand;
  final String last4;
  final void Function(String id) onDelete;

  /// Returns a String representation of credit card obscured part.
  ///
  /// Whitespace at the end also included to result String if needed.
  String _getObscuredPart(String brand) {
    switch (brand.toLowerCase()) {
      case 'amex':
      case 'americanexpress':
        return '**** ****** *';
      case 'mastercard':
      case 'visa':
        return '**** **** **** ';
      default:
        return '**** ';
    }
  }

  @override
  Widget build(BuildContext context) {
    final cardIcon = CreditCardUtils.getCardIconByBrand(brand, isColored: true);
    final obscuredPart = _getObscuredPart(brand);
    return Stack(
      children: [
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(6.r),
                  bottomRight: Radius.circular(6.r),
                ),
                color: MintColors.error,
              ),
            ),
          ),
        ),
        Slidable(
          key: ValueKey(id),
          endActionPane: ActionPane(
            extentRatio: 0.2,
            motion: const ScrollMotion(),
            children: <Widget>[
              CustomSlidableAction(
                onPressed: (context) => onDelete(id),
                autoClose: false,
                backgroundColor: Colors.transparent,
                child: const Icon(Icons.delete, color: Colors.white),
              ),
            ],
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: <Widget>[
                  _CardContainer(
                    child: cardIcon != null
                        ? cardIcon.svg()
                        : UndefinedCreditCardIcon(
                            width: 31.w,
                            height: 31.h,
                            color: Colors.white,
                          ),
                  ),
                  SizedBox(width: 10.w),
                  Text('$obscuredPart$last4', style: MintTextStyles.tagBig),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CardContainer extends StatelessWidget {
  const _CardContainer({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            color: Theme.of(context).brightness == Brightness.dark
                ? MintColors.greyDark.withOpacity(0.18)
                : MintColors.fillSecondaryLight.withOpacity(0.54),
          ),
          child: SizedBox(
            width: 53.w,
            height: 31.h,
          ),
        ),
        child,
      ],
    );
  }
}
