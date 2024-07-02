import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:secure_app_page/main.dart';
import 'package:secure_app_page/page/login_screen.dart';
import 'package:secure_app_page/page/pin_screen.dart';

import '../constants.dart';
import '../general_config_controller.dart';
import '../routes/app_routes.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    Future.delayed(Duration.zero,initSetup);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Center(child:Text("Splash screen ...",
      textAlign: TextAlign.center,))
    ],),),);
  }

  void initSetup() async {
    await Hive.initFlutter();
    await generalConfigController.openHiveBox();
debugPrint("====initSetup=======");
   String isLogin= generalConfigController.getDataFromHive(key: DBFields.isLoggedIn);
   if(isLogin=="true"){

     Get.offAllNamed(Routes.PINSCREEN);

   /*  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
         builder: (context) => PinScreen()), (Route route) => false);*/

   }else{
    /* Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
         builder: (context) => LoginScreen()), (Route route) => false);*/
     Get.offAllNamed(Routes.LOGIN);
   }
  }
}
