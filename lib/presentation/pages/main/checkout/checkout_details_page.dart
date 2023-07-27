import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/domain/entity/booking_data/booking_data.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/checkout/widgets/unordered_list.dart';
import 'package:mint/presentation/widgets/mint_app_bar.dart';
import 'package:mint/presentation/widgets/specialist_booking_tile.dart';
import 'package:mint/routes/app_router.gr.dart';
import 'package:mint/theme/mint_text_styles.dart';

import '../../../../bloc/booking/booking_bloc.dart';

@RoutePage()
class CheckoutDetailsPage extends StatelessWidget {
  const CheckoutDetailsPage({super.key, required this.bookingData});

  final BookingData bookingData;

  void _navigateToPayment(BuildContext context) {
    context.router.push(CheckoutPaymentRoute(bookingData: bookingData));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: const MintAppBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SpecialistBookingTile(
                    specialistModel: bookingData.specialistModel,
                    bookTime: bookingData.bookTime,
                    durationMinutes: bookingData.durationMinutes,
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    l10n.paymentDetails,
                    style: MintTextStyles.callOutSemiBold,
                  ),
                  SizedBox(height: 16.h),
                  UnorderedList(
                    [
                      l10n.afterPushingButtonPayText,
                      l10n.theMoneyWillBeWithdrawnText,
                      l10n.itsImportantThatYouShouldText,
                      l10n.signedUpForSessionText,
                    ],
                    textStyle: TextStyle(
                      fontSize: 15.sp,
                      height: 1.3,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? MintColors.greyDark
                          : MintColors.quarternary1,
                    ),
                    spaceBetween: 8.h,
                  ),
                  const Spacer(),
                  SizedBox(height: 24.h),
                  BlocBuilder<BookingBloc, BookingState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () => _navigateToPayment(context),
                        child: Text(l10n.pay),
                      );
                    },
                  ),
                  SizedBox(height: 26.h),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
