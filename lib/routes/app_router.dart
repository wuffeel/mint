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
            AutoRoute(
              path: '',
              page: PinCodeWrapperRoute.page,
              children: [
                AutoRoute(path: '', page: PinCodeRoute.page),
                AutoRoute(
                  page: ForgotPinOtpWrapperRoute.page,
                  children: [AutoRoute(page: OtpRoute.page)],
                ),
              ],
            ),
            AutoRoute(
              page: NavigationRoute.page,
              children: [
                AutoRoute(page: HomeRoute.page),
                AutoRoute(
                  page: SpecialistsWrapperRoute.page,
                  children: [
                    AutoRoute(path: '', page: SpecialistsRoute.page),
                    AutoRoute(page: SpecialistDetailsRoute.page),
                  ],
                ),
                AutoRoute(page: SessionsRoute.page),
                AutoRoute(page: ProfileRoute.page),
              ],
            ),
            AutoRoute(page: PickUpSpecialistRoute.page),
            AutoRoute(
              page: BookingWrapperRoute.page,
              children: [
                AutoRoute(path: '', page: BookingResumeRoute.page),
                AutoRoute(
                  page: CheckoutWrapperRoute.page,
                  children: [
                    AutoRoute(
                      path: '',
                      page: CheckoutDetailsRoute.page,
                    ),
                    AutoRoute(page: CheckoutPaymentRoute.page),
                  ],
                ),
              ],
            ),
          ],
        ),
      ];
}
