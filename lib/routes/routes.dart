import 'package:get/get.dart';
import 'package:untitled2/pages/add_task_screen.dart';
import 'package:untitled2/pages/homeScreen.dart';

class Routes {
  static List<GetPage> get Pages => [
        GetPage(name: '/homeScreen', page: () => HomeScreen()),
        GetPage(name: '/addTaskScreen', page: () => AddTaskScreen())
      ];
}
