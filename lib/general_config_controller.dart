import 'dart:convert';



import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';



class GeneralConfigController extends GetxController {

  Rx<dynamic> dbBox = Object().obs;

   String boxDBName="box";

 bool isScreenPaused=false;
  // Hive Methods
  Future<void> openHiveBox() async {
    var box = await Hive.openBox(boxDBName);
    dbBox.value = box;
  }

  Future<void> setHiveData({required String fieldName, var data}) async {
    debugPrint("Data saved to Hive with following structure \n {$fieldName : $data}");
    await dbBox.value!.put(fieldName, data);
  }

  dynamic getDataFromHive({required String key, String? defaultValue}) {
    return dbBox.value.get(key, defaultValue: defaultValue)??"";
  }

  Future<void> clearHiveData() async {
    await Hive.deleteFromDisk();
    await openHiveBox();
  }

  fetchHiveData({required String fieldName, var defaultValue}) async {
    if (await Hive.boxExists(boxDBName) && Hive.isBoxOpen(boxDBName)) {
      var data = dbBox.value!.get(fieldName) ?? defaultValue ?? "";
      debugPrint("Data retrieved from Hive Hive with following structure \n {$fieldName : $data}");
      return data;
    }
  }


}

GeneralConfigController generalConfigController = GeneralConfigController();
