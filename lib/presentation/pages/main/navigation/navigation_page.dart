import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mint/presentation/pages/main/navigation/widgets/mint_bottom_navigation.dart';
import 'package:mint/routes/app_router.gr.dart';

@RoutePage()
class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        SpecialistsRoute(),
        SessionsRoute(),
        ChatRoute(),
        ProfileRoute(),
      ],
      animationDuration: Duration.zero,
      bottomNavigationBuilder: (_, tabsRouter) {
        return MintBottomNavigation(tabsRouter: tabsRouter);
      },
    );
  }
}
