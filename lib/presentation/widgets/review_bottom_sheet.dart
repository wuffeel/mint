import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/bloc/review/review_bloc.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/pick_up_specialist/widgets/pick_up_stepper.dart';
import 'package:mint/presentation/pages/main/specialist_details/widgets/review_rating_button.dart';
import 'package:mint/presentation/widgets/bottom_sheet_app_bar.dart';
import 'package:mint/presentation/widgets/bottom_sheet_container.dart';
import 'package:mint/theme/mint_text_styles.dart';

import '../../backbone/review_session.dart';

class ReviewBottomSheet extends StatefulWidget {
  const ReviewBottomSheet({super.key, required this.specialistId});

  final String specialistId;

  @override
  State<ReviewBottomSheet> createState() => _ReviewBottomSheetState();
}

class _ReviewBottomSheetState extends State<ReviewBottomSheet> {
  final _reviewController = TextEditingController();
  ReviewSession? _selectedRating;

  String _getRatingTitle(ReviewSession reviewSession) {
    final l10n = context.l10n;
    switch (reviewSession) {
      case ReviewSession.helpful:
        return l10n.helpful;
      case ReviewSession.useful:
        return l10n.useful;
      case ReviewSession.good:
        return l10n.good;
      case ReviewSession.poor:
        return l10n.poor;
      case ReviewSession.notHelpful:
        return l10n.notHelpful;
      case ReviewSession.doNotRecommend:
        return l10n.doNotRecommend;
    }
  }

  void _onRatingSelect(BuildContext context, ReviewSession rating) {
    setState(() => _selectedRating = rating);
    context.read<ReviewBloc>().add(ReviewRatingSelected());
  }

  void _onSaveReview(BuildContext context) {
    final rating = _selectedRating?.rating;
    context.read<ReviewBloc>().add(
          ReviewAddRequested(
            specialistId: widget.specialistId,
            rating: rating,
            content: _reviewController.text.trim(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BottomSheetContainer(
      appBar: BottomSheetAppBar(
        title: Text(l10n.reviewSession, style: MintTextStyles.title2),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverFillRemaining(
              hasScrollBody: false,
              child: BlocConsumer<ReviewBloc, ReviewState>(
                listener: (context, state) {
                  if (state is ReviewAddSuccess) context.router.pop();
                },
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 32.h),
                      Text(
                        l10n.howWasYourConsultation,
                        style: MintTextStyles.headline,
                      ),
                      SizedBox(height: 16.h),
                      ...ReviewSession.values
                          .map<Widget>(
                            (value) => ReviewRatingButton(
                              value: value,
                              onSelect: (rating) =>
                                  _onRatingSelect(context, rating),
                              title: _getRatingTitle(value),
                              rating: value.rating,
                              isSelected: value == _selectedRating,
                            ),
                          )
                          .toList()
                          .insertBetween(SizedBox(height: 8.h)),
                      if (state is ReviewAddUnselectedFailure)
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: Text(
                            l10n.youHaveNotSelectedRating,
                            style: MintTextStyles.caption1.copyWith(
                              color: MintColors.error,
                            ),
                          ),
                        ),
                      SizedBox(height: 32.h),
                      Text(
                        l10n.pleaseDescribeYourExperience,
                        style: MintTextStyles.headline,
                      ),
                      SizedBox(height: 16.h),
                      TextField(
                        controller: _reviewController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.secondary,
                          hintText: '${l10n.typeHereYourImpressions}...',
                          hintStyle: MintTextStyles.body1.copyWith(
                            color: Theme.of(context).hintColor.withOpacity(0.3),
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.all(10.r),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        style: MintTextStyles.body1,
                      ),
                      const Spacer(),
                      SizedBox(height: 18.h),
                      if (state is! ReviewAddLoading)
                        ElevatedButton(
                          onPressed: () => _onSaveReview(context),
                          child: Text(l10n.leaveReview),
                        )
                      else
                        const Center(child: CircularProgressIndicator()),
                      SizedBox(height: 26.h),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
