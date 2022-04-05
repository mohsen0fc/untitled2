import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/controllers/task_controller.dart';
import 'package:untitled2/controllers/textfield_controller.dart';
import 'package:untitled2/models/task_model.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyAppbar(),
            Divider(height: 1.8, color: Colors.black87),
            Title(),
            Container(
              margin: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.task_outlined),
                    border: OutlineInputBorder(),
                    label: Text('Add Task')),
                textInputAction: TextInputAction.next,
                cursorHeight: 30,
                maxLines: 1,
                controller: Get.find<TextFieldController>().taskTitlee,
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: TextField(
                controller: Get.find<TextFieldController>().taskSubTitlee,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.bookmark_border),
                    border: OutlineInputBorder(),
                    label: Text('Add note')),
                textInputAction: TextInputAction.done,
                cursorHeight: 30,
                maxLines: 1,
              ),
            ),
            Button()
          ],
        )),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 15),
      child: Text(
        'what are you planning?',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class MyAppbar extends StatelessWidget {
  const MyAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '    ',
          style: TextStyle(color: Colors.black87, fontSize: 50),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            'New Task',
            style: TextStyle(
                // color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 15),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.close,
                size: 35,
              )),
        ),
      ],
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: Get.width,
        height: Get.height * 0.07,
        child: Hero(
          tag: 'myHero',
          child: ElevatedButton(
            child: Text(
              'Add',
            ),
            onPressed: () {
              Get.find<TaskController>().Task.add(TaskModel(
                  taskTitle: Get.find<TextFieldController>().taskTitlee!.text,
                  taskSubtitle:
                      Get.find<TextFieldController>().taskSubTitlee!.text,
                  status: false));
              Get.back();
            },
          ),
        ));
  }
}
