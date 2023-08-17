import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/bloc/credit_card/credit_card_bloc.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/profile/credit_cards/widgets/credit_card_delete_dialog.dart';
import 'package:mint/presentation/pages/main/profile/credit_cards/widgets/no_credit_cards_text.dart';
import 'package:mint/presentation/pages/main/profile/credit_cards/widgets/profile_credit_card.dart';
import 'package:mint/presentation/widgets/error_try_again_text.dart';
import 'package:mint/presentation/widgets/loading_indicator.dart';
import 'package:mint/presentation/widgets/mint_app_bar.dart';

import '../../checkout/credit_card_bottom_sheet.dart';

@RoutePage()
class ProfileCreditCardsPage extends StatelessWidget {
  const ProfileCreditCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CreditCardBloc>()..add(CreditCardListFetchRequested()),
      child: const _ProfileCreditCardsView(),
    );
  }
}

class _ProfileCreditCardsView extends StatelessWidget {
  const _ProfileCreditCardsView();

  void _onCardListRefresh(BuildContext context) {
    context.read<CreditCardBloc>().add(CreditCardListFetchRequested());
  }

  void _showCreditCardBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<CreditCardBloc>(),
        child: const CreditCardBottomSheet(hasSaveCard: false),
      ),
    );
  }

  void _onDeleteCard(BuildContext context, String paymentMethodId) {
    final creditCardBloc = context.read<CreditCardBloc>();
    showDialog<void>(
      context: context,
      builder: (context) => CreditCardDeleteDialog(
        onDelete: () {
          creditCardBloc.add(CreditCardDeleteRequested(paymentMethodId));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: const MintAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: <Widget>[
            SizedBox(height: 8.h),
            Expanded(
              child: BlocBuilder<CreditCardBloc, CreditCardState>(
                builder: (context, state) {
                  if (state is CreditCardListFetchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is CreditCardListFetchFailure) {
                    return ErrorTryAgainText(
                      title: '${l10n.couldNotLoadCreditCard}!',
                      onRefresh: () => _onCardListRefresh(context),
                    );
                  }
                  if (state is CreditCardListFetchSuccess) {
                    final cardList = state.cardList;
                    if (cardList.isEmpty) {
                      return const Center(child: NoCreditCardsText());
                    }
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return state is CreditCardDeleteLoading &&
                                state.cardId == cardList[index].id
                            ? const Center(child: LoadingIndicator())
                            : ProfileCreditCard(
                                id: cardList[index].id,
                                brand: cardList[index].cardBrand,
                                last4: cardList[index].last4,
                                onDelete: (cardId) =>
                                    _onDeleteCard(context, cardId),
                              );
                      },
                      separatorBuilder: (_, __) => SizedBox(height: 8.h),
                      itemCount: cardList.length,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            ElevatedButton(
              onPressed: () => _showCreditCardBottomSheet(context),
              child: Text(context.l10n.addCreditCard),
            ),
            SizedBox(height: 26.h),
          ],
        ),
      ),
    );
  }
}
