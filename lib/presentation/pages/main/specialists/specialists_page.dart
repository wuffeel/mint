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
import 'package:mint/presentation/widgets/mint_app_bar.dart';
import 'package:mint/presentation/widgets/mint_back_button.dart';
import 'package:mint/presentation/widgets/mint_refresh_indicator.dart';
import 'package:mint/presentation/widgets/no_items_found.dart';
import 'package:mint/presentation/widgets/specialist_catalogue_container.dart';

import '../../../../domain/entity/filter_preferences/filter_preferences.dart';
import '../../../widgets/specialist_card_tile.dart';

@RoutePage()
class SpecialistsPage extends StatefulWidget {
  const SpecialistsPage({super.key});

  @override
  State<SpecialistsPage> createState() => _SpecialistsPageState();
}

class _SpecialistsPageState extends State<SpecialistsPage> {
  void _showFilterModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<SpecialistFilterBloc>()
          ..add(SpecialistFilterGetSelected()),
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

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);
    return Scaffold(
      appBar: MintAppBar(
        leading: MintBackButton(
          onPressed: () => tabsRouter.setActiveIndex(
            tabsRouter.previousIndex ?? 0,
          ),
        ),
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
      body: SpecialistCatalogueContainer(
        child: BlocBuilder<SpecialistCatalogueBloc, SpecialistCatalogueState>(
          builder: (context, state) {
            if (state is SpecialistCatalogueLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SpecialistCatalogueFetchFailure) {
              return ErrorTryAgainText(onRefresh: _refreshCatalogue);
            }
            if (state is SpecialistCatalogueFetchSuccess) {
              if (state.specialistList.isEmpty) {
                return NoItemsFound(
                  title: context.l10n.noSpecialistsFound,
                  subTitle: context.l10n.tryToSearchWithDifferentFilter,
                );
              }
              return MintRefreshIndicator(
                onRefresh: _refreshCatalogue,
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList.builder(
                      itemCount: state.specialistList.length,
                      itemBuilder: (context, index) {
                        return SpecialistCardTile(
                          specialistModel: state.specialistList[index],
                        );
                      },
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
