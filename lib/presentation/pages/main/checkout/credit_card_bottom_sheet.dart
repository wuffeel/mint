import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/checkout/widgets/card_expiration_text_field.dart';
import 'package:mint/presentation/pages/main/checkout/widgets/credit_card_text_field.dart';
import 'package:mint/presentation/widgets/bottom_sheet_app_bar.dart';
import 'package:mint/presentation/widgets/bottom_sheet_container.dart';
import 'package:mint/theme/mint_text_styles.dart';

import '../../../widgets/mint_text_form_field.dart';

class CreditCardBottomSheet extends StatefulWidget {
  const CreditCardBottomSheet({super.key});

  @override
  State<CreditCardBottomSheet> createState() => _CreditCardBottomSheetState();
}

class _CreditCardBottomSheetState extends State<CreditCardBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  var _autoValidateMode = AutovalidateMode.disabled;
  final _creditCardController = TextEditingController();
  final _expireDateController = TextEditingController();
  final _cvvController = TextEditingController();

  bool _isSaveCard = false;

  bool get isButtonEnabled =>
      _creditCardController.text.isNotEmpty &&
      _expireDateController.text.isNotEmpty &&
      _cvvController.text.isNotEmpty;

  void _validateForm() {
    final form = _formKey.currentState;
    if (form != null && !form.validate()) {
      setState(() => _autoValidateMode = AutovalidateMode.onUserInteraction);
    }
  }

  String? _cvvValidator(String? value) {
    if (value == null) return null;
    if (value.length < 3) {
      return context.l10n.wrongCvv;
    }
    return null;
  }

  @override
  void dispose() {
    _creditCardController.dispose();
    _expireDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BottomSheetContainer(
      appBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: BottomSheetAppBar(title: Text(l10n.addCardDetails)),
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                top: 24.h,
                bottom: MediaQuery.viewInsetsOf(context).bottom + 24.h,
              ),
              child: Form(
                key: _formKey,
                autovalidateMode: _autoValidateMode,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CreditCardTextField(
                      controller: _creditCardController,
                      hintText: l10n.cardNumber,
                      onChanged: (_) => setState(() {
                        // TODO(wuffeel): nothing here.
                      }),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: CardExpirationTextField(
                            controller: _expireDateController,
                            onChanged: (_) => setState(() {
                              // TODO(wuffeel): nothing here.
                            }),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: MintTextFormField(
                            controller: _cvvController,
                            maxLength: 4,
                            hintText: 'CVC/CVV',
                            textInputAction: TextInputAction.done,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            onChanged: (_) => setState(() {
                              // TODO(wuffeel): nothing here.
                            }),
                            validator: _cvvValidator,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: ColoredBox(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? MintColors.fillSecondaryLight
                                        .withOpacity(0.15)
                                    : MintColors.greyDark,
                            child: SizedBox(
                              width: 24.w,
                              height: 24.h,
                              child: Transform.scale(
                                scale: 1.4,
                                child: Checkbox(
                                  value: _isSaveCard,
                                  onChanged: (value) => setState(() {
                                    if (value != null) _isSaveCard = value;
                                  }),
                                  activeColor:
                                      Theme.of(context).colorScheme.primary,
                                  side: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          l10n.saveCardData,
                          style: MintTextStyles.body1.copyWith(
                            color: Theme.of(context).hintColor.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(height: 24.h),
                    ElevatedButton(
                      onPressed: isButtonEnabled ? _validateForm : null,
                      child: Text(l10n.addCard),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
