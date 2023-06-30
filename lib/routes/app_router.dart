import 'package:auto_route/auto_route.dart';
import 'package:mint/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(initial: true, page: EnterPhoneRoute.page),
    AutoRoute(page: OtpRoute.page),
  ];
}
