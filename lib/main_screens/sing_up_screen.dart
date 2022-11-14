import 'package:blog_online/animations/left_to_right_fade.dart';
import 'package:blog_online/animations/sing_btn_animaation.dart';
import 'package:blog_online/animations/up_to_down_fade.dart';
import 'package:blog_online/utility/constants.dart';
import 'package:blog_online/utility/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyTabController myTabController = Get.put(MyTabController());
    SingAnimation singAnimation = Get.put(SingAnimation());

    return WillPopScope(
      onWillPop: () async {
        myTabController.tabController.index = 0;
        return false;
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 47,
            left: 15,
            child: LeftToRight(
              dely: 1.7,
              child: Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () {
                    myTabController.tabController.index = 0;
                  },
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Form(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UpToDownFade(
                    dely: 0.2,
                    child: Text(
                      'Sing up',
                      style: TextStyle(
                        fontSize: 37,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  UpToDownFade(
                    dely: 0.4,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: blueColor,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 31,
                            ),
                            Expanded(
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Username',
                                  hintStyle: TextStyle(
                                    color: Colors.white60,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  UpToDownFade(
                    dely: 0.6,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: blueColor,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                              size: 31,
                            ),
                            Expanded(
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'E-mail',
                                  hintStyle: TextStyle(
                                    color: Colors.white60,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  UpToDownFade(
                    dely: 0.8,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: blueColor,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.password_outlined,
                              color: Colors.white,
                              size: 31,
                            ),
                            Expanded(
                              child: TextFormField(
                                obscureText: true,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    color: Colors.white60,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      myTabController.tabController.index = 2;
                    },
                    child: UpToDownFade(
                      dely: 1,
                      child: Text(
                        'I have already an account ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          UpToDownFade(
            dely: 1.7,
            child: InkWell(
              onTap: () async {
                await singAnimation.controller.forward();
                await singAnimation.controller.reverse();
                myTabController.tabController.index = 2;
              },
              child: SingUpBtnAnimation(
                singUpController: singAnimation.controller,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
