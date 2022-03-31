import 'package:get/get.dart';
import 'package:untitled2/pages/homeScreen.dart';

class Routes {
  static List<GetPage> get Pages =>
      [GetPage(name: '/homeScreen', page: () => HomeScreen())];
}
