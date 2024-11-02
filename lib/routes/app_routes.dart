import 'package:get/get.dart';

import 'package:expense_tracker/presentation/splash_screen/splash_screen.dart';
import 'package:expense_tracker/presentation/splash_screen/binding/splash_binding.dart';
// final authMiddleware = AuthMiddleware();

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  // static const String resourceScreen = '/learning_screen';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
  ];
}
