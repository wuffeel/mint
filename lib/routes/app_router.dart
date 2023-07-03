import 'package:auto_route/auto_route.dart';
import 'package:mint/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, page: LogInCheckRoute.page),
        AutoRoute(
          page: SignUpWrapperRoute.page,
          children: [
            AutoRoute(path: '', page: EnterPhoneRoute.page),
            AutoRoute(page: OtpRoute.page),
          ],
        ),
        AutoRoute(
          page: NavigationWrapperRoute.page,
          children: [
            AutoRoute(path: '', page: NavigationRoute.page),
          ],
        ),
      ];
}
