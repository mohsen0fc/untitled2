import 'package:get/get.dart';
import 'package:untitled2/controllers/task_controller.dart';
import 'package:untitled2/controllers/textfield_controller.dart';
import 'package:untitled2/controllers/theme_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeController());
    Get.lazyPut(() => TaskController());
    Get.put(TextFieldController());
  }
}
