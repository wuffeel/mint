import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../../bloc/specialist_online/specialist_online_bloc.dart';
import '../../../../../theme/mint_text_styles.dart';
import '../../../../widgets/specialist_card_tile.dart';
import '../../../../widgets/specialist_catalogue_container.dart';
import '../../../../widgets/specialist_shimmer_sliver_list.dart';

class DoctorsOnlineSliverList extends StatelessWidget {
  const DoctorsOnlineSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SliverStack(
      children: <Widget>[
        const SliverPositioned.fill(
          child: SpecialistCatalogueContainer(),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          sliver: MultiSliver(
            children: <Widget>[
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 32.h),
                    Text(
                      l10n.doctorsOnline,
                      style: MintTextStyles.title1,
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
              BlocBuilder<SpecialistOnlineBloc, SpecialistOnlineState>(
                builder: (context, state) {
                  if (state is SpecialistOnlineLoading) {
                    return const SpecialistShimmerSliverList();
                  }
                  if (state is SpecialistOnlineFetchSuccess) {
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
