import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDark = false.obs;
  void toggle() {
    isDark.value = !isDark.value;
  }

  void setTheme() {
    Get.find<ThemeController>().toggle();
    if (isDark.value) {
      Get.changeTheme(ThemeData.dark());
      // Get.snackbar(
      //   '',
      //   '',
      //   //titleText: Text('تم تاریک فعال شد', textAlign: TextAlign.center),
      //   messageText: Text('تم تاریک فعال شد',
      //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      //       textAlign: TextAlign.center),
      //   duration: Duration(seconds: 2),
      // );
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.black54, //
          systemNavigationBarColor: Colors.red // status bar color
          ));
    } else {
      Get.changeTheme(ThemeData.light());
      // Get.snackbar(
      //   '',
      //   '',
      //   //titleText: Text('تم تاریک فعال شد', textAlign: TextAlign.center),
      //   messageText: Text('تم تاریک غیر فعال شد',
      //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
      //       textAlign: TextAlign.center),
      //   duration: Duration(seconds: 2),
      // );
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.blue[700],
      ));
    }
  }
}
