import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../general_config_controller.dart';
import '../routes/app_routes.dart';
import 'home_screen.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  TextEditingController pinTextEditingController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(child:Container( margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(children: [
      const Text("Welcome to Pin screen",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w700),),
      const SizedBox(height: 30,),

        TextField (
          controller: pinTextEditingController,
          decoration:const InputDecoration(
              border: InputBorder.none,
              labelText: 'Enter pin',
              hintText: 'Enter pin'
          ),
        ),
        const SizedBox(height: 35,),
        GestureDetector(
          onTap: () {
            if(pinTextEditingController.text.isNotEmpty){

            /*  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
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
                "Submit",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        )
    ],),)),);
  }
}
