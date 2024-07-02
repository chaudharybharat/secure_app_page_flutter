import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../general_config_controller.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome come to Home screen',
            ),
            const SizedBox(height: 30,),
            GestureDetector(
              onTap: () {
                Get.offAllNamed(Routes.LOGIN);
                generalConfigController.setHiveData(fieldName: DBFields.isLoggedIn,data: "false");


              },
              child: Container(
                height: 60,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8.0)),
                child: Center(
                  child: Text(
                    "Logout",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
