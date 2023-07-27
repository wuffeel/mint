import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/domain/entity/booking_data/booking_data.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/checkout/credit_card_bottom_sheet.dart';
import 'package:mint/presentation/pages/main/checkout/widgets/add_credit_card_button.dart';
import 'package:mint/presentation/pages/main/checkout/widgets/credit_card_selection.dart';
import 'package:mint/presentation/pages/main/checkout/widgets/exit_payment_dialog.dart';
import 'package:mint/presentation/pages/main/checkout/widgets/specialist_payment_tile.dart';
import 'package:mint/presentation/widgets/loading_indicator.dart';
import 'package:mint/presentation/widgets/mint_app_bar.dart';

import '../../../../bloc/credit_card/credit_card_bloc.dart';
import '../../../../bloc/transaction/transaction_bloc.dart';
import '../../../../domain/entity/credit_card_model/credit_card_model.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../routes/app_router.gr.dart';

@RoutePage()
class CheckoutPaymentPage extends StatelessWidget {
  const CheckoutPaymentPage({super.key, required this.bookingData});

  final BookingData bookingData;

  void _transactionListener(BuildContext context, TransactionState state) {
    if (state is TransactionPaySuccess) {
      context.router.navigate(
        const NavigationWrapperRoute(
          children: [
            NavigationRoute(children: [HomeRoute()]),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<TransactionBloc>()),
        BlocProvider(
          create: (context) =>
              getIt<CreditCardBloc>()..add(CreditCardListFetchRequested()),
        ),
      ],
      child: BlocListener<TransactionBloc, TransactionState>(
        listener: _transactionListener,
        child: _CheckoutPaymentView(bookingData: bookingData),
      ),
    );
  }
}

class _CheckoutPaymentView extends StatefulWidget {
  const _CheckoutPaymentView({
    required this.bookingData,
  });

  final BookingData bookingData;

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

  void _checkout() {
    final card = _selectedCard;
    if (card == null) return;
    final bookingData = widget.bookingData;
    context.read<TransactionBloc>().add(
          TransactionPayRequested(
            bookingId: bookingData.id,
            specialistId: bookingData.specialistModel.id,
            paymentMethodId: card.id,
            amount: bookingData.specialistModel.price,
          ),
        );
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
    final price = widget.bookingData.specialistModel.price;
    return WillPopScope(
      onWillPop: () async => await _showExitConfirmDialog(context) ?? false,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: const MintAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SpecialistPaymentTile(
                specialistModel: widget.bookingData.specialistModel,
                bookTime: widget.bookingData.bookTime,
              ),
              SizedBox(height: 16.h),
              const Divider(),
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
                      onSelect: (card) => setState(() => _selectedCard = card),
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
                        onPressed: _selectedCard != null ? _checkout : null,
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
                        onPressed: _selectedCard != null ? _checkout : null,
                        child: Text(
                          '${l10n.pay} $price₴',
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 26.h),
            ],
          ),
        ),
      ),
    );
  }
}
