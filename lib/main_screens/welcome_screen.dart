import 'package:blog_online/animations/up_to_down_fade.dart';
import 'package:blog_online/utility/constants.dart';
import 'package:blog_online/utility/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyTabController myTabController = Get.put(MyTabController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UpToDownFade(
                dely: 0.3,
                child: Text(
                  'Free Real Api',
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 24,
                  ),
                ),
              ),
              UpToDownFade(
                dely: 0.6,
                child: Text(
                  'Flutter Wings',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 33,
                  ),
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 30),
          child: Column(
            children: [
              UpToDownFade(
                dely: 0.9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    primary: Colors.white,
                  ),
                  onPressed: () {
                    myTabController.tabController.index = 1;
                  },
                  child: Text(
                    'SING UP',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              UpToDownFade(
                dely: 1.2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    primary: blueColor,
                  ),
                  onPressed: () {},
                  child: Text(
                    'SIN IN WITH FACEBOOK',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
