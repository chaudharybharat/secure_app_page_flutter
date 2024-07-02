
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:secure_app_page/page/home_screen.dart';
import 'package:secure_app_page/page/pin_screen.dart';

import '../page/login_screen.dart';
import '../page/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LANGUAGEOPTIONS;
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
    ),

    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
    ), GetPage(
      name: Routes.PINSCREEN,
      page: () => const PinScreen(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const HomeScreen(),
    ),
  ];
}
