import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/constant.dart';
import 'package:untitled2/controllers/task_controller.dart';
import 'package:untitled2/controllers/theme_controller.dart';
import 'package:untitled2/controllers/textfield_controller.dart';
import 'package:untitled2/pages/add_task_screen.dart';
import 'package:untitled2/routes/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingAction(),
      body: SafeArea(
        child: Stack(alignment: Alignment.bottomCenter, children: [
          TopSectionWidget(),
          BottomSectionWidget(),
        ]),
      ),
    );
  }
}

var myTask = Get.find<TaskController>().Task;
var a = myTask.length;
String result = '';

class FloatingAction extends StatelessWidget {
  const FloatingAction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'myHero',
      onPressed: () {
        Get.find<TextFieldController>().taskTitlee!.text = '';
        Get.find<TextFieldController>().taskSubTitlee!.text = '';
        Get.toNamed('/addTaskScreen');
      },
      child: Icon(Icons.add),
    );
  }
}

class TopSectionWidget extends StatelessWidget {
  const TopSectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (a > 1) {
      result = 'Tasks';
    } else {
      result = 'task';
    }
    a > 1 ? result = 'tasks' : result = 'task';
    return Container(
        width: Get.width,
        height: Get.height,
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
                  Obx(() {
                    return CupertinoSwitch(
                        trackColor: Colors.blue[800],
                        activeColor: Color(0xff00eFff),
                        value: Get.find<ThemeController>().isDark.value,
                        onChanged: (value) {
                          Get.find<ThemeController>().setTheme();
                        });
                  }),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40, top: 10),
              child: CircleAvatar(
                radius: 35.0,
                backgroundColor: Theme.of(context).secondaryHeaderColor,
                child: Icon(
                  Icons.task,
                  size: 35,
                  color: Theme.of(context).toggleableActiveColor,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 50, top: 16),
                child: Text(
                  'All Tasks',
                  style: TextStyle(fontSize: 35),
                )),
            Container(
                margin: EdgeInsets.only(left: 50, top: 5),
                child: Obx(() {
                  return Text(
                      '${myTask.length}${myTask.length > 1 ? ' Tasks' : ' Task'}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700));
                })),
          ],
        ));
  }
}

class BottomSectionWidget extends StatelessWidget {
  const BottomSectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height - 250,
      decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(35), topLeft: Radius.circular(35))),
      child: Container(
        margin: EdgeInsets.only(left: 40, top: 20, right: 30),
        child: Obx(() {
          return ListView.separated(
              itemBuilder: (context, index) => ListTile(
                    title: Text(myTask[index].taskTitle ?? ''),
                    subtitle: Text(myTask[index].taskSubtitle ?? ''),
                    trailing: Checkbox(
                      value: myTask[index].status,
                      side: BorderSide(color: Colors.black, width: 2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      onChanged: (bool? value) {},
                    ),
                    onTap: () {},
                    onLongPress: () {
                      Get.find<TaskController>().Task.removeAt(index);
                    },
                  ),
              separatorBuilder: (context, index) =>
                  Divider(height: 1, color: Colors.black45),
              itemCount: myTask.length);
        }),
      ),
    );
  }
}
