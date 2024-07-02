import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:secure_app_page/page/splash_screen.dart';
import 'package:secure_app_page/routes/app_pages.dart';
import 'package:secure_app_page/routes/app_routes.dart';
import 'package:secure_app_page/secure_application.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SecureApplication(

      child: GetMaterialApp(
      title: 'Flutter Demo',
          getPages: AppPages.routes,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    initialRoute: Routes.SPLASH,
    ));
  }
}



