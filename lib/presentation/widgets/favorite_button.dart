import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/widgets/favorite_icon.dart';
import 'package:mint/presentation/widgets/mint_alert_dialog.dart';
import 'package:mint_core/mint_core.dart';
import 'package:shimmer/shimmer.dart';

import '../../bloc/favorite/favorite_bloc.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.specialistModel,
    this.showDialogOnFavoriteRemove = false,
    this.isIconButton = false,
    this.iconButtonPadding,
    this.iconButtonConstraints,
  });

  final SpecialistModel specialistModel;
  final bool isIconButton;

  /// Determines whether the favorite removal confirmation dialog should be
  /// displayed.
  final bool showDialogOnFavoriteRemove;

  /// [isIconButton] should be true
  final EdgeInsetsGeometry? iconButtonPadding;

  /// [isIconButton] should be true
  final BoxConstraints? iconButtonConstraints;

  void _handleFavorite(BuildContext context, bool isFavorite) {
    if (showDialogOnFavoriteRemove && isFavorite) {
      final specialistName = specialistModel.firstName;
      showDialog<void>(
        context: context,
        builder: (dialogContext) => _RemoveFavoriteDialog(
          specialistName: specialistName,
          onAction: () {
            _toggleFavorite(context, isFavorite);
            dialogContext.router.pop();
          },
        ),
      );
    } else {
      _toggleFavorite(context, isFavorite);
    }
  }

  void _toggleFavorite(BuildContext context, bool isFavorite) {
    isFavorite
        ? context
            .read<FavoriteBloc>()
            .add(FavoriteRemoveRequested(specialistModel))
        : context
            .read<FavoriteBloc>()
            .add(FavoriteAddRequested(specialistModel));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteFetchSuccess) {
          final isFavorite = state.favoriteList.any(
            (specialist) => specialist.id == specialistModel.id,
          );
          return isIconButton
              ? IconButton(
                  onPressed: () => _handleFavorite(context, isFavorite),
                  padding: iconButtonPadding,
                  constraints: iconButtonConstraints,
                  icon: FavoriteIcon(isFavorite: isFavorite),
                )
              : InkWell(
                  onTap: () => _handleFavorite(context, isFavorite),
                  child: FavoriteIcon(isFavorite: isFavorite),
                );
        }
        return Shimmer.fromColors(
          baseColor: Theme.of(context).hintColor.withOpacity(0.6),
          highlightColor: Colors.white,
          child: const FavoriteIcon(),
        );
      },
    );
  }
}

class _RemoveFavoriteDialog extends StatelessWidget {
  const _RemoveFavoriteDialog({
    required this.specialistName,
    required this.onAction,
  });

  final String specialistName;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return MintAlertDialog(
      title: Text(l10n.removeFavoriteTitle),
      content: Text('${l10n.removeFavoriteContent(specialistName)}?'),
      actionTitle: context.l10n.yes,
      onAction: onAction,
    );
  }
}
