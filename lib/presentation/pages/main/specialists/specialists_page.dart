import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/bloc/specialist_catalogue/specialist_catalogue_bloc.dart';
import 'package:mint/bloc/specialist_filter/specialist_filter_bloc.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/specialists/widgets/filter_action_button.dart';
import 'package:mint/presentation/pages/main/specialists/widgets/filter_bottom_sheet.dart';
import 'package:mint/presentation/widgets/error_try_again_text.dart';
import 'package:mint/presentation/widgets/loading_indicator.dart';
import 'package:mint/presentation/widgets/mint_app_bar.dart';
import 'package:mint/presentation/widgets/mint_back_button.dart';
import 'package:mint/presentation/widgets/mint_refresh_indicator.dart';
import 'package:mint/presentation/widgets/no_items_found.dart';
import 'package:mint/presentation/widgets/specialist_catalogue_container.dart';
import 'package:mint/presentation/widgets/specialist_shimmer_sliver_list.dart';

import '../../../../domain/entity/filter_preferences/filter_preferences.dart';
import '../../../widgets/specialist_card_tile.dart';

@RoutePage()
class SpecialistsPage extends StatefulWidget {
  const SpecialistsPage({super.key});

  @override
  State<SpecialistsPage> createState() => _SpecialistsPageState();
}

class _SpecialistsPageState extends State<SpecialistsPage> {
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
    context.read<SpecialistCatalogueBloc>().add(
          SpecialistCatalogueFetchRequested(),
        );
  }

  void _showFilterModalBottomSheet(BuildContext context) {
    context.read<SpecialistFilterBloc>().add(SpecialistFilterGetSelected());
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<SpecialistFilterBloc>(),
        child: const FilterBottomSheet(),
      ),
    );
  }

  bool _isBadgeVisible(SpecialistFilterState state) {
    return state is SpecialistFilterLoadSuccess &&
        state.appliedFilters != FilterPreferences.empty;
  }

  void _refreshCatalogue() {
    context
        .read<SpecialistCatalogueBloc>()
        .add(SpecialistCatalogueRefreshRequested());
  }

  void _navigateBack(TabsRouter tabsRouter) {
    return tabsRouter.setActiveIndex(tabsRouter.previousIndex ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);
    return WillPopScope(
      onWillPop: () async {
        _navigateBack(tabsRouter);
        return false;
      },
      child: Scaffold(
        appBar: MintAppBar(
          leading: MintBackButton(onPressed: () => _navigateBack(tabsRouter)),
          leadingWidth: 80.w,
          actions: [
            BlocBuilder<SpecialistFilterBloc, SpecialistFilterState>(
              builder: (_, state) {
                return FilterActionButton(
                  isBadgeVisible: _isBadgeVisible(state),
                  onPressed: () => _showFilterModalBottomSheet(context),
                );
              },
            ),
          ],
        ),
        body: MintRefreshIndicator(
          onRefresh: _refreshCatalogue,
          child: SpecialistCatalogueContainer(
            child: CustomScrollView(
              controller: _paginationScroll,
              slivers: <Widget>[
                BlocBuilder<SpecialistCatalogueBloc, SpecialistCatalogueState>(
                  builder: (context, state) {
                    if (state is SpecialistCatalogueFetchSuccess) {
                      if (state.specialistList.isEmpty &&
                          state is! SpecialistCatalogueLoading) {
                        return SliverFillRemaining(
                          hasScrollBody: false,
                          child: NoItemsFound(
                            title: context.l10n.noSpecialistsFound,
                            subTitle:
                                context.l10n.tryToSearchWithDifferentFilter,
                          ),
                        );
                      }
                      return SliverList.builder(
                        itemCount: state.specialistList.length,
                        itemBuilder: (context, index) {
                          return SpecialistCardTile(
                            specialistModel: state.specialistList[index],
                          );
                        },
                      );
                    }
                    return const SliverToBoxAdapter(child: SizedBox.shrink());
                  },
                ),
                BlocBuilder<SpecialistCatalogueBloc, SpecialistCatalogueState>(
                  builder: (context, state) {
                    if (state is SpecialistCatalogueLoading) {
                      return state.specialistList.isEmpty
                          ? const SpecialistShimmerSliverList(itemCount: 8)
                          : const SliverToBoxAdapter(
                              child: Center(child: LoadingIndicator()),
                            );
                    }
                    if (state is SpecialistCatalogueFetchFailure) {
                      return SliverFillRemaining(
                        hasScrollBody: false,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: ErrorTryAgainText(
                            onRefresh: _refreshCatalogue,
                          ),
                        ),
                      );
                    }
                    return const SliverToBoxAdapter(child: SizedBox.shrink());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
