import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/bloc/review/review_bloc.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/specialist_details/widgets/review_rating_button.dart';
import 'package:mint/presentation/widgets/bottom_sheet_app_bar.dart';
import 'package:mint/presentation/widgets/bottom_sheet_fixed_container.dart';
import 'package:mint/presentation/widgets/multiline_text_field.dart';
import 'package:mint/theme/mint_text_styles.dart';
import 'package:mint_core/mint_utils.dart';

import '../../backbone/review_session.dart';
import '../../domain/entity/review_model/review_model.dart';

class ReviewBottomSheet extends StatefulWidget {
  const ReviewBottomSheet({
    super.key,
    required this.specialistId,
    this.userReview,
  });

  final String specialistId;
  final ReviewModel? userReview;

  @override
  State<ReviewBottomSheet> createState() => _ReviewBottomSheetState();
}

class _ReviewBottomSheetState extends State<ReviewBottomSheet> {
  final _reviewController = TextEditingController();
  late double? _selectedRating = widget.userReview?.rating;

  /// Controller used to set TextField cursor to the end if userReview is not
  /// null
  final _reviewScroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _reviewController.text = widget.userReview?.content ?? '';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _reviewScroll.jumpTo(_reviewScroll.position.maxScrollExtent);
    });
  }

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

  void _onRatingSelect(BuildContext context, double rating) {
    setState(() => _selectedRating = rating);
    context.read<ReviewBloc>().add(ReviewRatingSelected());
  }

  /// Adds or updates the review considering userReview provided or not
  void _onSaveReview(BuildContext context) {
    final userReview = widget.userReview;
    if (userReview == null) {
      context.read<ReviewBloc>().add(
            ReviewAddRequested(
              specialistId: widget.specialistId,
              rating: _selectedRating,
              content: _reviewController.text.trim(),
            ),
          );
    } else {
      context.read<ReviewBloc>().add(
            ReviewUpdateRequested(
              userReview.copyWith(
                rating: _selectedRating ?? userReview.rating,
                content: _reviewController.text.trim(),
              ),
            ),
          );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _reviewController.dispose();
    _reviewScroll.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BottomSheetFixedContainer(
      appBar: BottomSheetAppBar(
        title: Text(
          widget.userReview == null ? l10n.reviewSession : l10n.updateReview,
          style: MintTextStyles.title2,
        ),
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
                              onSelect: (value) =>
                                  _onRatingSelect(context, value.rating),
                              title: _getRatingTitle(value),
                              rating: value.rating,
                              isSelected: value.rating == _selectedRating,
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
                      MultilineTextField(
                        controller: _reviewController,
                        scrollController: _reviewScroll,
                        maxLines: 3,
                        hintText: '${l10n.typeHereYourImpressions}...',
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
