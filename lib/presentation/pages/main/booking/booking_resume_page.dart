import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/bloc/booking/booking_bloc.dart';
import 'package:mint/domain/entity/booking_data/booking_data.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/booking/widgets/booking_resume_details.dart';
import 'package:mint/presentation/pages/main/booking/widgets/exit_booking_dialog.dart';
import 'package:mint/presentation/widgets/error_alert_dialog.dart';
import 'package:mint/presentation/widgets/error_snack_bar.dart';
import 'package:mint/presentation/widgets/loading_indicator.dart';
import 'package:mint/presentation/widgets/mint_app_bar.dart';
import 'package:mint/presentation/widgets/multiline_text_field.dart';
import 'package:mint/presentation/widgets/specialist_card_tile.dart';
import 'package:mint/routes/app_router.gr.dart';
import 'package:mint/theme/mint_text_styles.dart';
import 'package:mint_core/mint_core.dart';

@RoutePage()
class BookingResumePage extends StatelessWidget {
  const BookingResumePage({
    super.key,
    required this.specialistModel,
    required this.bookTime,
    required this.durationMinutes,
    this.previousBookingData,
  });

  final SpecialistModel specialistModel;
  final DateTime bookTime;
  final int durationMinutes;

  /// Provided if reschedule is required
  final BookingData? previousBookingData;

  /// Requests either booking or reschedule, depending on whether
  /// [previousBookingData] provided or not respectively
  void _bookSpecialist(BuildContext context, String notes) {
    final previous = previousBookingData;
    final bookingBloc = context.read<BookingBloc>();
    if (previous != null) {
      bookingBloc.add(
        BookingRescheduleRequested(previous, bookTime, notes, durationMinutes),
      );
    } else {
      bookingBloc.add(
        BookingBookRequested(specialistModel, bookTime, notes, durationMinutes),
      );
    }
  }

  /// Navigates user to checkout on successful booking
  void _bookingStatusListener(BuildContext context, BookingState state) {
    if (state is BookingBookSuccess) {
      context.router.replace(
        CheckoutDetailsRoute(bookingData: state.bookingData),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingBloc, BookingState>(
      listener: _bookingStatusListener,
      child: _BookingResumeView(
        specialistModel: specialistModel,
        bookTime: bookTime,
        durationMinutes: durationMinutes,
        previousBookingData: previousBookingData,
        onBookSpecialist: (notes) => _bookSpecialist(context, notes),
      ),
    );
  }
}

class _BookingResumeView extends StatefulWidget {
  const _BookingResumeView({
    required this.specialistModel,
    required this.bookTime,
    required this.durationMinutes,
    required this.onBookSpecialist,
    this.previousBookingData,
  });

  final SpecialistModel specialistModel;
  final DateTime bookTime;
  final int durationMinutes;
  final BookingData? previousBookingData;
  final void Function(String) onBookSpecialist;

  @override
  State<_BookingResumeView> createState() => _BookingResumePageState();
}

class _BookingResumePageState extends State<_BookingResumeView> {
  final _notesController = TextEditingController();
  var _shouldPop = false;

  void _bookingListener(BuildContext context, BookingState state) {
    if (state is BookingBookDuplicateFailure ||
        state is BookingBookLateFailure) {
      _showErrorDialog(context, state);
    }
    if (state is BookingBookFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        ErrorSnackBar(content: Text(context.l10n.somethingWentWrongTryAgain)),
      );
    }
  }

  void _showErrorDialog(BuildContext context, BookingState state) {
    final l10n = context.l10n;
    final String errorTitle;
    final String content;

    if (state is BookingBookDuplicateFailure) {
      errorTitle = l10n.timeIsBookedTitle;
      content = l10n.chosenTimeAlreadyBooked;
    } else if (state is BookingBookLateFailure) {
      errorTitle = l10n.bookTimePassedTitle;
      content = l10n.chosenBookTimePassed;
    } else {
      return;
    }

    setState(() => _shouldPop = true);
    showDialog<void>(
      context: context,
      useRootNavigator: false,
      builder: (dialogContext) => ErrorAlertDialog(
        actionTitle: l10n.close,
        title: Text(errorTitle),
        content: Text(content),
        onAction: () {
          context.router.popUntilRoot();
          dialogContext.router.pop();
        },
      ),
    );
  }

  Future<bool?> _showExitConfirmDialog(BuildContext context) async {
    return showDialog<bool?>(
      context: context,
      builder: (context) => const ExitBookingDialog(),
    );
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return WillPopScope(
      onWillPop: () async =>
          _shouldPop || (await _showExitConfirmDialog(context) ?? false),
      child: Scaffold(
        appBar: const MintAppBar(),
        body: BlocListener<BookingBloc, BookingState>(
          listener: _bookingListener,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SpecialistCardTile(
                        specialistModel: widget.specialistModel,
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        l10n.consultationSummary,
                        style: MintTextStyles.headline1,
                      ),
                      SizedBox(height: 16.h),
                      BookingResumeDetails(
                        bookTime: widget.bookTime,
                        minutesDuration: widget.durationMinutes,
                      ),
                      SizedBox(height: 16.h),
                      MultilineTextField(
                        controller: _notesController,
                        maxLines: 3,
                        hintText: '${l10n.typeHerePersonalNotes}...',
                      ),
                      const Spacer(),
                      SizedBox(height: 20.h),
                      BlocBuilder<BookingBloc, BookingState>(
                        builder: (context, state) {
                          if (state is BookingBookLoading) {
                            return const Center(child: LoadingIndicator());
                          }
                          return ElevatedButton(
                            onPressed: () => widget.onBookSpecialist(
                              _notesController.text.trim(),
                            ),
                            child: Text(l10n.book),
                          );
                        },
                      ),
                      SizedBox(height: 26.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
