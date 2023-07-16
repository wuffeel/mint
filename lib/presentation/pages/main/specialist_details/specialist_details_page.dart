import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/bloc/review/review_bloc.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/specialist_details/widgets/opaque_tab_bar.dart';
import 'package:mint/presentation/pages/main/specialist_details/widgets/review_sliver_list.dart';
import 'package:mint/presentation/pages/main/specialist_details/widgets/specialist_details_widget.dart';
import 'package:mint/presentation/pages/main/specialist_details/widgets/specialist_sliver_app_bar.dart';
import 'package:mint/presentation/widgets/favorite_button.dart';

import '../../../../theme/mint_text_styles.dart';
import '../../../widgets/mint_back_button.dart';
import '../../../widgets/review_bottom_sheet.dart';

@RoutePage()
class SpecialistDetailsPage extends StatelessWidget {
  const SpecialistDetailsPage({
    super.key,
    required this.specialistModel,
  });

  final SpecialistModel specialistModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ReviewBloc>()..add(ReviewFetchRequested(specialistModel.id)),
      child: _SpecialistDetailsView(specialistModel),
    );
  }
}

class _SpecialistDetailsView extends StatefulWidget {
  const _SpecialistDetailsView(this.specialistModel);

  final SpecialistModel specialistModel;

  @override
  State<_SpecialistDetailsView> createState() => _SpecialistDetailsViewState();
}

class _SpecialistDetailsViewState extends State<_SpecialistDetailsView> {
  late final tabs = [
    context.l10n.about,
    context.l10n.education,
    context.l10n.reviews,
  ];
  final _scrollController = ScrollController();

  void _onReviewRefresh() {
    return context.read<ReviewBloc>().add(
          ReviewFetchRequested(widget.specialistModel.id),
        );
  }

  void _showReviewModalBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<ReviewBloc>(),
        child: ReviewBottomSheet(specialistId: widget.specialistModel.id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  context,
                ),
                sliver: SpecialistSliverAppBar(
                  scrollController: _scrollController,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  pinned: true,
                  // TODO(wuffel): investigate overflow caused by this widget
                  // or ignore
                  leading: const MintBackButton(),
                  leadingWidth: 80.w,
                  forceElevated: innerBoxIsScrolled,
                  actions: [
                    FavoriteButton(
                      specialistModel: widget.specialistModel,
                      isActionButton: true,
                    ),
                  ],
                  flexibleSpace: Padding(
                    padding: EdgeInsets.only(bottom: 24.h),
                    child: SpecialistDetailsWidget(
                      specialistModel: widget.specialistModel,
                    ),
                  ),
                  bottom: OpaqueTabBar(
                    tabBar: TabBar(
                      tabs: List.generate(
                        tabs.length,
                        (index) => Tab(child: Text(tabs[index])),
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: List.generate(tabs.length, (index) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(tabs[index]),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context,
                          ),
                        ),
                        if (index == 0)
                          SliverPadding(
                            padding: EdgeInsets.all(16.r),
                            sliver: SliverToBoxAdapter(
                              child: Text(
                                widget.specialistModel.about ?? '',
                                style: MintTextStyles.body1,
                              ),
                            ),
                          ),
                        if (index == 1)
                          SliverPadding(
                            padding: EdgeInsets.all(16.r),
                            sliver: SliverToBoxAdapter(
                              child: Text(
                                widget.specialistModel.education ?? '',
                                style: MintTextStyles.body1,
                              ),
                            ),
                          ),
                        if (index == 2) ...[
                          SliverPadding(
                            padding: EdgeInsets.symmetric(
                              vertical: 12.h,
                              horizontal: 16.w,
                            ),
                            sliver: SliverToBoxAdapter(
                              child: ElevatedButton(
                                onPressed: _showReviewModalBottomSheet,
                                child: const Text('Add review'),
                              ),
                            ),
                          ),
                          ReviewSliverList(onRefresh: _onReviewRefresh),
                        ],
                      ],
                    );
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
