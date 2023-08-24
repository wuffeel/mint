import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/widgets/error_try_again_text.dart';
import 'package:mint/presentation/widgets/loading_indicator.dart';

import '../../../../../bloc/previous_sessions/previous_sessions_bloc.dart';
import '../../../../../routes/app_router.gr.dart';
import '../../../../widgets/no_items_found.dart';
import '../../home/widgets/upcoming_session_container.dart';

class PreviousSessionsList extends StatefulWidget {
  const PreviousSessionsList({super.key, this.padding});

  final EdgeInsetsGeometry? padding;

  @override
  State<PreviousSessionsList> createState() => _PreviousSessionsListState();
}

class _PreviousSessionsListState extends State<PreviousSessionsList> {
  final _paginationScroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _paginationScroll.addListener(() {
      if (_paginationScroll.position.pixels >
          _paginationScroll.position.maxScrollExtent * 0.8) {
        _loadNextPage(context);
      }
    });
  }

  void _loadNextPage(BuildContext context) {
    context.read<PreviousSessionsBloc>().add(PreviousSessionsFetchRequested());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _paginationScroll,
      slivers: <Widget>[
        BlocBuilder<PreviousSessionsBloc, PreviousSessionsState>(
          builder: (context, state) {
            if (state is PreviousSessionsFetchSuccess) {
              final sessionsList = state.previousList;

              if (sessionsList.isEmpty &&
                  state is! PreviousSessionsFetchLoading) {
                return SliverToBoxAdapter(
                  child: NoItemsFound(
                    title: context.l10n.noSpecialistsFound,
                    subTitle: context.l10n.tryToSearchWithDifferentFilter,
                  ),
                );
              }

              return SliverPadding(
                padding: widget.padding ?? EdgeInsets.zero,
                sliver: SliverList.separated(
                  itemCount: sessionsList.length,
                  separatorBuilder: (_, __) => SizedBox(height: 10.h),
                  itemBuilder: (context, index) => UpcomingSessionContainer(
                    onTap: () => context.router.push(
                      SessionDetailsRoute(bookingData: sessionsList[index]),
                    ),
                    bookingData: sessionsList[index],
                  ),
                ),
              );
            }
            return const SliverToBoxAdapter(child: SizedBox.shrink());
          },
        ),
        BlocBuilder<PreviousSessionsBloc, PreviousSessionsState>(
          builder: (context, state) {
            if (state is PreviousSessionsFetchLoading) {
              return const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(child: LoadingIndicator()),
              );
            }
            if (state is PreviousSessionsFetchFailure) {
              return SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: ErrorTryAgainText(
                    onRefresh: () => context
                        .read<PreviousSessionsBloc>()
                        .add(PreviousSessionsRefreshRequested()),
                  ),
                ),
              );
            }
            return const SliverToBoxAdapter(child: SizedBox.shrink());
          },
        )
      ],
    );
  }
}
