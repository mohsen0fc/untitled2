import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/bindings/bindings.dart';
import 'package:untitled2/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MyBindings(),
      getPages: Routes.Pages,
      initialRoute: '/homeScreen',
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
      ),
    );
  }
}
// Get average runtime of successful runs in seconds
