import 'package:blog_online/utility/constants.dart';
import 'package:flutter/material.dart';

class SingInBtnAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> clickBox;
  final Animation<double> zoomOutBox;
  final Animation<double> radius;
  final Animation<Color?> color;
  final double width;

  SingInBtnAnimation({
    Key? key,
    required this.controller,
    required this.width,
  })  : clickBox = Tween(begin: width - 14, end: 60.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.15, curve: Curves.decelerate),
          ),
        ),
        zoomOutBox = Tween(begin: 60.0, end: 1000.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 1.0, curve: Curves.decelerate),
          ),
        ),
        radius = Tween(begin: 50.0, end: 0.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
          ),
        ),
        color = ColorTween(begin: blueColor, end: Colors.white).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 1.0, curve: Curves.ease),
          ),
        ),
        super(key: key);

  Widget SingInAnimation(BuildContext context, Widget? child) {
    return zoomOutBox.value >= 70
        ? Container(
            width: zoomOutBox.value,
            height: zoomOutBox.value,
            decoration: BoxDecoration(
              color: color.value,
              borderRadius: BorderRadius.circular(radius.value),
            ),
          )
        : Container(
            margin: EdgeInsets.only(bottom: 30),
            width: clickBox.value,
            height: 60,
            decoration: BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: clickBox.value <= (width - 60)
                  ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      'SING IN',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: SingInAnimation);
  }
}

class SingUpBtnAnimation extends StatelessWidget {
  final AnimationController singUpController;
  final Animation<double> clickPressed;
  final Animation<double> afterClickPressed;
  final Animation<double> radius;
  final Animation<Color?> color;
  final double width;
  SingUpBtnAnimation({
    Key? key,
    required this.singUpController,
    required this.width,
  })  : clickPressed = Tween(begin: width - 14, end: 60.0).animate(
          CurvedAnimation(
            parent: singUpController,
            curve: Interval(0.0, 0.15, curve: Curves.decelerate),
          ),
        ),
        afterClickPressed = Tween(begin: width - 14, end: 60.0).animate(
          CurvedAnimation(
            parent: singUpController,
            curve: Interval(0.0, 0.15, curve: Curves.decelerate),
          ),
        ),
        radius = Tween(begin: 50.0, end: 0.0).animate(
          CurvedAnimation(
            parent: singUpController,
            curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
          ),
        ),
        color = ColorTween(begin: blueColor, end: Colors.white).animate(
          CurvedAnimation(
            parent: singUpController,
            curve: Interval(0.5, 1.0, curve: Curves.ease),
          ),
        ),
        super(key: key);

  Widget SingUpAnimation(BuildContext context, Widget? child) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: clickPressed.value,
      height: 60,
      decoration: BoxDecoration(
        color: blueColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: clickPressed.value <= (width - 60)
            ? CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                'SING UP',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: singUpController, builder: SingUpAnimation);
  }
}
