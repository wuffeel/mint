import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/checkout/credit_card_bottom_sheet.dart';
import 'package:mint/presentation/pages/main/checkout/widgets/credit_card_selection.dart';
import 'package:mint/presentation/pages/main/checkout/widgets/specialist_payment_tile.dart';
import 'package:mint/presentation/widgets/loading_indicator.dart';
import 'package:mint/presentation/widgets/mint_app_bar.dart';
import 'package:mint/theme/mint_text_styles.dart';

import '../../../../bloc/booking/booking_bloc.dart';
import '../../../../bloc/transaction/transaction_bloc.dart';
import '../../../../domain/entity/credit_card_model/credit_card_model.dart';
import '../../../../domain/entity/specialist_model/specialist_model.dart';
import '../../../../gen/assets.gen.dart';

@RoutePage()
class CheckoutPaymentPage extends StatefulWidget {
  const CheckoutPaymentPage({
    super.key,
    required this.specialistModel,
    required this.date,
    required this.time,
    required this.durationMinutes,
  });

  final SpecialistModel specialistModel;
  final DateTime date;
  final DateTime time;
  final int durationMinutes;

  @override
  State<CheckoutPaymentPage> createState() => _CheckoutPaymentPageState();
}

class _CheckoutPaymentPageState extends State<CheckoutPaymentPage> {
  CreditCardModel? _selectedCard;
  final _cardList = <CreditCardModel>[
    const CreditCardModel(
      number: '3443535633232233',
      expirationMonth: 5,
      expirationYear: 2023,
      cvv: 123,
    ),
    const CreditCardModel(
      number: '4443535633233344',
      expirationMonth: 5,
      expirationYear: 2023,
      cvv: 123,
    ),
    const CreditCardModel(
      number: '5443535633234455',
      expirationMonth: 5,
      expirationYear: 2023,
      cvv: 123,
    ),
  ];

  void _showCreditCardBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const CreditCardBottomSheet(),
    );
  }

  void _checkout(BookingState state) {
    if (state is BookingBookSuccess) {
      context.read<TransactionBloc>().add(
            TransactionPayRequested(
              state.bookingData.id,
              widget.specialistModel.id,
              widget.specialistModel.price,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const MintAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: BlocBuilder<BookingBloc, BookingState>(
          builder: (context, bookingState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SpecialistPaymentTile(
                  specialistModel: widget.specialistModel,
                  date: widget.date,
                  time: widget.time,
                ),
                SizedBox(height: 16.h),
                Divider(height: 1.h, thickness: 1.h),
                SizedBox(height: 16.h),
                CreditCardSelection(
                  cards: _cardList,
                  selectedCard: _selectedCard,
                  onSelect: (card) => setState(() => _selectedCard = card),
                ),
                SizedBox(height: 24.h),
                InkWell(
                  onTap: () => _showCreditCardBottomSheet(context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: 28.w,
                        height: 28.h,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: Assets.svg.plusIcon.svg(
                          width: 17.w,
                          height: 17.h,
                          fit: BoxFit.scaleDown,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : MintColors.quarternary1,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(l10n.addCreditCard, style: MintTextStyles.tab16),
                    ],
                  ),
                ),
                const Spacer(),
                BlocBuilder<TransactionBloc, TransactionState>(
                  builder: (context, state) {
                    if (state is TransactionPayLoading) {
                      return const Center(child: LoadingIndicator());
                    }
                    return Column(
                      children: <Widget>[
                        OutlinedButton(
                          onPressed: () => _checkout(bookingState),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(l10n.payWith),
                              Assets.svg.appleIcon.svg(
                                width: 24.w,
                                height: 24.h,
                                fit: BoxFit.scaleDown,
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).iconTheme.color ??
                                      Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.h),
                        ElevatedButton(
                          onPressed: () => _checkout(bookingState),
                          child: Text(
                            '${l10n.pay} ${widget.specialistModel.price}₴',
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 26.h),
              ],
            );
          },
        ),
      ),
    );
  }
}
