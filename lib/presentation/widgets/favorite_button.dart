import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';
import 'package:mint/presentation/widgets/favorite_icon.dart';
import 'package:shimmer/shimmer.dart';

import '../../bloc/favorite/favorite_bloc.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.specialistModel,
    this.isIconButton = false,
  });

  final SpecialistModel specialistModel;
  final bool isIconButton;

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
                  onPressed: () => _toggleFavorite(context, isFavorite),
                  padding: isIconButton ? null : EdgeInsets.zero,
                  constraints: isIconButton ? null : const BoxConstraints(),
                  icon: FavoriteIcon(isFavorite: isFavorite),
                )
              : InkWell(
                  onTap: () => _toggleFavorite(context, isFavorite),
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
