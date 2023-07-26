import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mint/bloc/credit_card/credit_card_bloc.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/checkout/widgets/credit_card_text_field.dart';
import 'package:mint/presentation/widgets/bottom_sheet_app_bar.dart';
import 'package:mint/presentation/widgets/bottom_sheet_fixed_container.dart';
import 'package:mint/presentation/widgets/loading_indicator.dart';
import 'package:mint/theme/mint_text_styles.dart';

class CreditCardBottomSheet extends StatelessWidget {
  const CreditCardBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreditCardBloc, CreditCardState>(
      listener: (context, state) {
        if (state is CreditCardSaveSuccess) context.router.pop();
      },
      child: const _CreditCardBottomSheetView(),
    );
  }
}

class _CreditCardBottomSheetView extends StatefulWidget {
  const _CreditCardBottomSheetView();

  @override
  State<_CreditCardBottomSheetView> createState() =>
      _CreditCardBottomSheetViewState();
}

class _CreditCardBottomSheetViewState
    extends State<_CreditCardBottomSheetView> {
  final _creditCardController = CardEditController();

  bool _isSaveCard = false;

  bool get isButtonEnabled => _creditCardController.complete;

  void _saveCard() {
    context
        .read<CreditCardBloc>()
        .add(CreditCardSaveRequested(isSaveForFuture: _isSaveCard));
  }

  @override
  void dispose() {
    _creditCardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BottomSheetFixedContainer(
      height: MediaQuery.sizeOf(context).height * 0.75,
      appBar: BottomSheetAppBar(title: Text(l10n.addCardDetails)),
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
              child: BlocBuilder<CreditCardBloc, CreditCardState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CreditCardTextField(
                        controller: _creditCardController,
                        onCardChanged: (_) => setState(() => {}),
                      ),
                      if (state is CreditCardSaveFailure) ...[
                        SizedBox(height: 8.h),
                        Text(
                          state is CreditCardSaveDuplicateFailure
                              ? 'Duplicate card'
                              : context.l10n.somethingWentWrongTryAgain,
                          style: MintTextStyles.buttonsHuge.copyWith(
                            color: MintColors.error,
                          ),
                        ),
                      ],
                      SizedBox(height: 16.h),
                      Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: ColoredBox(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
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
                              color:
                                  Theme.of(context).hintColor.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(height: 24.h),
                      if (state is CreditCardSaveLoading)
                        const Center(child: LoadingIndicator())
                      else
                        ElevatedButton(
                          onPressed: isButtonEnabled ? _saveCard : null,
                          child: Text(l10n.addCard),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
