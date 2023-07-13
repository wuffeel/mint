import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/bloc/specialist_catalogue/specialist_catalogue_bloc.dart';
import 'package:mint/bloc/user/user_bloc.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/home/widgets/home_app_bar.dart';
import 'package:mint/presentation/pages/main/home/widgets/pick_up_specialist_button.dart';
import 'package:mint/presentation/widgets/doctor_card_tile.dart';
import 'package:mint/presentation/widgets/specialist_catalogue_container.dart';
import 'package:mint/theme/mint_text_styles.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SpecialistCatalogueBloc>()
        ..add(SpecialistCatalogueFetchRequested()),
      child: const _HomePageView(),
    );
  }
}

class _HomePageView extends StatelessWidget {
  const _HomePageView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        final user = state is UserFetchSuccess ? state.user : null;
        final photo = user?.photoUrl;
        return Scaffold(
          appBar: HomeAppBar(photo: photo, nameTag: user?.nameTag),
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
                child: const PickUpSpecialistButton(),
              ),
              Expanded(
                child: SpecialistCatalogueContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 32.h),
                      Text(
                        l10n.doctorsOnline,
                        style: MintTextStyles.title1,
                      ),
                      SizedBox(height: 8.h),
                      Expanded(
                        child: BlocBuilder<SpecialistCatalogueBloc,
                            SpecialistCatalogueState>(
                          builder: (context, state) {
                            if (state is SpecialistCatalogueLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (state is SpecialistCatalogueFetchSuccess) {
                              return CustomScrollView(
                                slivers: <Widget>[
                                  SliverList.builder(
                                    itemCount: state.specialistList.length,
                                    itemBuilder: (context, index) {
                                      return DoctorCardTile(
                                        specialistModel:
                                            state.specialistList[index],
                                      );
                                    },
                                  ),
                                ],
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}