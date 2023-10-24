import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/widgets/error_try_again_text.dart';
import 'package:mint/presentation/widgets/mint_app_bar.dart';
import 'package:mint/presentation/widgets/no_items_found.dart';
import 'package:mint/presentation/widgets/specialist_card_tile.dart';

import '../../../../../bloc/favorite/favorite_bloc.dart';

@RoutePage()
class FavoriteDoctorsPage extends StatelessWidget {
  const FavoriteDoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<FavoriteBloc>()
        ..add(FavoriteFetchSpecialistsRequested()),
      child: const _FavoriteDoctorsView(),
    );
  }
}

class _FavoriteDoctorsView extends StatelessWidget {
  const _FavoriteDoctorsView();

  void _fetchFavorites(BuildContext context) {
    context.read<FavoriteBloc>().add(FavoriteFetchSpecialistsRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MintAppBar(),
      body: ColoredBox(
        color: Theme.of(context).colorScheme.background,
        child: CustomScrollView(
          slivers: <Widget>[
            BlocBuilder<FavoriteBloc, FavoriteState>(
              builder: (context, state) {
                if (state is FavoriteLoading &&
                    state.loadingType == FavoriteLoadingType.specialists) {
                  return const _SliverCenter(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is FavoriteFetchSpecialistsFailure) {
                  return _SliverCenter(
                    child: ErrorTryAgainText(
                      onRefresh: () => _fetchFavorites(context),
                    ),
                  );
                }
                if (state is FavoriteFetchSuccess) {
                  final favoriteList = state.favoriteSpecialists;
                  if (favoriteList.isEmpty) {
                    return _SliverCenter(
                      child: NoItemsFound(
                        title: '${context.l10n.noFavoriteSpecialistsYet}!',
                      ),
                    );
                  }
                  return SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    sliver: SliverList.builder(
                      itemCount: favoriteList.length,
                      itemBuilder: (context, index) => SpecialistCardTile(
                        specialistModel: favoriteList[index],
                        showDialogOnFavoriteRemove: true,
                      ),
                    ),
                  );
                }
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverCenter extends StatelessWidget {
  const _SliverCenter({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: child,
      ),
    );
  }
}
