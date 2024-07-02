import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:secure_app_page/routes/app_routes.dart';

import 'constants.dart';
import 'general_config_controller.dart';

export './secure_application.dart';

/// Widget that will manage Secure Gates and visibility protection for your app content
///
/// Should be above any [SecureGate]
/// provide to all it descendants a [SecureApplicationController] that can be used to secure/open and lock/unlock
class SecureApplication extends StatefulWidget {
  /// Child of the widget
  final Widget child;


  const SecureApplication({
    Key? key,
    required this.child,

  }) : super(key: key);

  @override
  _SecureApplicationState createState() => _SecureApplicationState();
}

class _SecureApplicationState extends State<SecureApplication>
    with WidgetsBindingObserver {


  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addObserver(this);

  }

  @override
  void dispose() {

    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        debugPrint("======resumed======");
        if(generalConfigController.isScreenPaused){
          generalConfigController.isScreenPaused=false;
          String isLogin= generalConfigController.getDataFromHive(key: DBFields.isLoggedIn);
          if(isLogin=="true") {
            Get.offAllNamed(Routes.PINSCREEN);
          }
        }




        super.didChangeAppLifecycleState(state);
        break;
      case AppLifecycleState.paused:
        generalConfigController.isScreenPaused=true;
        debugPrint("======paused======");
        super.didChangeAppLifecycleState(state);
        break;
      default:
        super.didChangeAppLifecycleState(state);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {

    return  widget.child;
  }
}
