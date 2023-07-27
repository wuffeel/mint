import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/checkout/credit_card_bottom_sheet.dart';
import 'package:mint/presentation/pages/main/checkout/widgets/add_credit_card_button.dart';
import 'package:mint/presentation/pages/main/checkout/widgets/credit_card_selection.dart';
import 'package:mint/presentation/pages/main/checkout/widgets/exit_payment_dialog.dart';
import 'package:mint/presentation/pages/main/checkout/widgets/specialist_payment_tile.dart';
import 'package:mint/presentation/widgets/loading_indicator.dart';
import 'package:mint/presentation/widgets/mint_app_bar.dart';

import '../../../../bloc/booking/booking_bloc.dart';
import '../../../../bloc/credit_card/credit_card_bloc.dart';
import '../../../../bloc/transaction/transaction_bloc.dart';
import '../../../../domain/entity/credit_card_model/credit_card_model.dart';
import '../../../../domain/entity/specialist_model/specialist_model.dart';
import '../../../../gen/assets.gen.dart';

@RoutePage()
class CheckoutPaymentPage extends StatelessWidget {
  const CheckoutPaymentPage({
    super.key,
    required this.specialistModel,
    required this.bookTime,
    required this.durationMinutes,
  });

  final SpecialistModel specialistModel;
  final DateTime bookTime;
  final int durationMinutes;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CreditCardBloc>()..add(CreditCardListFetchRequested()),
      child: _CheckoutPaymentView(
        specialistModel: specialistModel,
        bookTime: bookTime,
        durationMinutes: durationMinutes,
      ),
    );
  }
}

class _CheckoutPaymentView extends StatefulWidget {
  const _CheckoutPaymentView({
    required this.specialistModel,
    required this.bookTime,
    required this.durationMinutes,
  });

  final SpecialistModel specialistModel;
  final DateTime bookTime;
  final int durationMinutes;

  @override
  State<_CheckoutPaymentView> createState() => _CheckoutPaymentViewState();
}

class _CheckoutPaymentViewState extends State<_CheckoutPaymentView> {
  CreditCardModel? _selectedCard;

  void _showCreditCardBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<CreditCardBloc>(),
        child: const CreditCardBottomSheet(),
      ),
    );
  }

  void _checkout(BookingState state) {
    final card = _selectedCard;
    if (card == null) return;
    if (state is BookingBookSuccess) {
      context.read<TransactionBloc>().add(
            TransactionPayRequested(
              bookingId: state.bookingData.id,
              specialistId: widget.specialistModel.id,
              paymentMethodId: card.id,
              amount: widget.specialistModel.price,
            ),
          );
    }
  }

  Future<bool?> _showExitConfirmDialog(BuildContext context) async {
    return showDialog<bool?>(
      context: context,
      builder: (context) => ExitPaymentDialog(
        onExit: () {
          // TODO(wuffeel): payment cancelled, should booking be deleted?
          context.router.pop(true);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return WillPopScope(
      onWillPop: () async {
        return await _showExitConfirmDialog(context) ?? false;
      },
      child: Scaffold(
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
                    bookTime: widget.bookTime,
                  ),
                  SizedBox(height: 16.h),
                  Divider(height: 1.h, thickness: 1.h),
                  SizedBox(height: 16.h),
                  BlocBuilder<CreditCardBloc, CreditCardState>(
                    builder: (context, state) {
                      if (state is CreditCardListFetchLoading) {
                        return const Center(child: LoadingIndicator());
                      }
                      if (state is CreditCardListFetchSuccess) {
                        return CreditCardSelection(
                          cards: state.cardList,
                          selectedCard: _selectedCard,
                          onSelect: (card) =>
                              setState(() => _selectedCard = card),
                          itemCount: state.cardList.length,
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  SizedBox(height: 24.h),
                  AddCreditCardButton(
                    onTap: () => _showCreditCardBottomSheet(context),
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
                            onPressed: _selectedCard != null
                                ? () => _checkout(bookingState)
                                : null,
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
                            onPressed: _selectedCard != null
                                ? () => _checkout(bookingState)
                                : null,
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
      ),
    );
  }
}
