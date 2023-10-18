import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/specialist_catalogue/specialist_catalogue_bloc.dart';
import '../../../../bloc/specialist_filter/specialist_filter_bloc.dart';
import '../../../../injector/injector.dart';

@RoutePage()
class SpecialistsWrapperPage extends AutoRouter implements AutoRouteWrapper {
  const SpecialistsWrapperPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<SpecialistCatalogueBloc>()
            ..add(SpecialistCatalogueFetchRequested()),
        ),
        BlocProvider(
          create: (context) => getIt<SpecialistFilterBloc>()
            ..add(SpecialistFilterFetchRequested()),
        ),
      ],
      child: this,
    );
  }
}
