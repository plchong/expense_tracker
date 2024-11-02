import 'package:expense_tracker/routes/app_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:expense_tracker/controllers/loading_controller.dart';
import 'package:expense_tracker/core/app_export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((value) {
  //   Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
  //   runApp(MyApp());
  // });
  runApp(MyApp());
}

// class MyApp extends GetWidget<AuthController> {
class MyApp extends GetWidget {
  @override
  Widget build(BuildContext context) {
    // LoadingController? loadingController = Get.find<LoadingController>();
    var app = GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // translations: AppLocalization(),
      // locale: Locale("en", "US"), //for setting localization strings
      // locale: Get.locale, //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: 'Expense Tracker',
      // theme: lightTheme,
      // darkTheme: darkTheme,
      builder: (_, widget) {
        return Container(
              color: Colors.white,
              child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    // if (loadingController.isLoading.value)
                    //   Container(
                    //     decoration: BoxDecoration(color: Colors.black54),
                    //   ),
                    // if (loadingController.isLoading.value)
                    //   Positioned(
                    //     height: 80,
                    //     width: 80,
                    //     child: CircularProgressIndicator(
                    //       color: Colors.teal,
                    //       strokeWidth: 10,
                    //     ),
                    //   ),
                    if (widget != null) widget,
                  ]),
            );
      },
      // themeMode: themeManager.themeMode,
      // initialBinding: InitialBindings(),
      initialRoute: AppRoutes.splashScreen,
      getPages: AppRoutes.pages,

      // supportedLocales: [Locale('en', 'US'), Locale('zh', 'HK')],
      // localizationsDelegates: GlobalMaterialLocalizations.delegates,
    );

    print("supportedLocales ${app.supportedLocales}");

    return app;
  }
}
