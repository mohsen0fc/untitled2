import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldController extends GetxController {
  TextEditingController? taskTitlee;
  TextEditingController? taskSubTitlee;
  @override
  void onInit() {
    taskTitlee = TextEditingController();
    taskSubTitlee = TextEditingController();
    super.onInit();
  }
}
