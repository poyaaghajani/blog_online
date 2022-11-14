import 'package:blog_online/utility/controller.dart';
import 'package:blog_online/main_screens/sin_in_screen.dart';
import 'package:blog_online/main_screens/sing_up_screen.dart';
import 'package:blog_online/main_screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingScreen extends StatelessWidget {
  const SingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyTabController myTabController = Get.put(MyTabController());
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/leafs.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black38,
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: myTabController.tabController,
            children: [
              WelcomeScreen(),
              SingUpScreen(),
              SingInScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
