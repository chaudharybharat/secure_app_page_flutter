import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:secure_app_page/general_config_controller.dart';

import '../constants.dart';
import '../routes/app_routes.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController userIdTextEditingController=TextEditingController();
  TextEditingController passwordTextEditingController=TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(children: [
        const Text("Login Screen",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w700),),
        const SizedBox(height: 30,),
          TextField (
            controller: userIdTextEditingController,
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Enter User id',
                hintText: 'Enter User Id'
            ),
          ),
          const SizedBox(height: 20,),
          TextField (
            controller: passwordTextEditingController,
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Enter Passord',
                hintText: 'Enter Passord'
            ),
          ),
          SizedBox(height: 35,),
          GestureDetector(
            onTap: () {
              if(userIdTextEditingController.text.isNotEmpty && passwordTextEditingController.text.isNotEmpty){
             generalConfigController.setHiveData(fieldName: DBFields.isLoggedIn,data: "true");
                /*Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                    builder: (context) => HomeScreen()), (Route route) => false);*/
                Get.offAllNamed(Routes.DASHBOARD);
              }

            },
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.0)),
              child: Center(
                child: Text(
                  "LOGIN In",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.white,
                      fontSize: 16.0,
                     fontWeight: FontWeight.w600),
                ),
              ),
            ),
          )
            ],),
      ),),);;
  }
}
