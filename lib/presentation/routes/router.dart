import 'package:auto_route/auto_route.dart';
import 'package:domain_driven_design/presentation/sign_in/sign_in_page.dart';
import 'package:domain_driven_design/presentation/splash/splash_page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: SignInRoute.page),
      ];
}
