import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/bloc/booking/booking_bloc.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/booking/widgets/booking_resume_details.dart';
import 'package:mint/presentation/widgets/mint_app_bar.dart';
import 'package:mint/presentation/widgets/multiline_text_field.dart';
import 'package:mint/presentation/widgets/specialist_card_tile.dart';
import 'package:mint/theme/mint_text_styles.dart';

@RoutePage()
class BookingResumePage extends StatelessWidget {
  const BookingResumePage({
    super.key,
    required this.specialistModel,
    required this.date,
    required this.time,
    required this.minutesDuration,
  });

  final SpecialistModel specialistModel;
  final DateTime date;
  final DateTime time;
  final int minutesDuration;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BookingBloc>(),
      child: BlocListener<BookingBloc, BookingState>(
        listener: (context, state) {
          if (state is BookingBookSuccess) context.router.pop();
        },
        child: _BookingResumeView(
          specialistModel: specialistModel,
          date: date,
          time: time,
          minutesDuration: minutesDuration,
        ),
      ),
    );
  }
}

class _BookingResumeView extends StatefulWidget {
  const _BookingResumeView({
    required this.specialistModel,
    required this.date,
    required this.time,
    required this.minutesDuration,
  });

  final SpecialistModel specialistModel;
  final DateTime date;
  final DateTime time;
  final int minutesDuration;

  @override
  State<_BookingResumeView> createState() => _BookingResumePageState();
}

class _BookingResumePageState extends State<_BookingResumeView> {
  final _notesController = TextEditingController();

  void _bookSpecialist() {
    return context.read<BookingBloc>().add(
      BookingBookRequested(
        widget.specialistModel.id,
        widget.date,
        widget.time,
        _notesController.text.trim(),
      ),
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
    return Scaffold(
      appBar: const MintAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SpecialistCardTile(specialistModel: widget.specialistModel),
                  SizedBox(height: 24.h),
                  Text(
                    l10n.consultationSummary,
                    style: MintTextStyles.headline1,
                  ),
                  SizedBox(height: 16.h),
                  BookingResumeDetails(
                    date: widget.date,
                    time: widget.time,
                    minutesDuration: widget.minutesDuration,
                  ),
                  SizedBox(height: 16.h),
                  MultilineTextField(
                    controller: _notesController,
                    maxLines: 3,
                    hintText: '${l10n.typeHerePersonalNotes}...',
                  ),
                  const Spacer(),
                  SizedBox(height: 20.h),
                  ElevatedButton(
                    onPressed: _bookSpecialist,
                    child: Text(l10n.book),
                  ),
                  SizedBox(height: 26.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
