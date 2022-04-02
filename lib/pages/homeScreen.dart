import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/pages/add_task_screen.dart';
import 'package:untitled2/routes/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddTaskScreen());
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Stack(alignment: Alignment.bottomCenter, children: [
          TopSectionWidget(),
          BottomSectionWidget(),
        ]),
      ),
    );
  }
}

class TopSectionWidget extends StatelessWidget {
  const TopSectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        height: Get.height,
        color: Colors.lightBlue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40, top: 15),
              child: CircleAvatar(
                radius: 25,
                child: Icon(Icons.task),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 50, top: 16),
                child: Text(
                  'All',
                  style: TextStyle(fontSize: 25),
                )),
            Container(
                margin: EdgeInsets.only(left: 50, top: 5),
                child: Text('Tasks', style: TextStyle(fontSize: 18))),
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
      height: Get.height * 0.69,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(35), topLeft: Radius.circular(35))),
      child: Container(
        margin: EdgeInsets.only(left: 40, top: 20, right: 30),
        child: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  title: Text('Title'),
                  subtitle: Text('subTitle'),
                  leading: Icon(Icons.height),
                  trailing: Checkbox(
                    value: false,
                    side: BorderSide(color: Colors.black, width: 2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    onChanged: (bool? value) {},
                  ),
                  onTap: () {},
                ),
            separatorBuilder: (context, index) =>
                Divider(height: 1, color: Colors.black45),
            itemCount: 10),
      ),
    );
  }
}
