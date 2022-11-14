import 'package:flutter/material.dart';

class LeftToRight extends StatefulWidget {
  final Widget child;
  final double dely;
  LeftToRight({Key? key, required this.child, required this.dely})
      : super(key: key);

  @override
  State<LeftToRight> createState() => _LeftToRightState();
}

class _LeftToRightState extends State<LeftToRight>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> opacity;
  late Animation<double> translateX;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    opacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.ease),
    );
    translateX = Tween(begin: -50.0, end: 0.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.ease),
    );
    startAnimation();
    super.initState();
  }

  startAnimation() async {
    await Future.delayed(
      Duration(
        milliseconds: (widget.dely * 1000).round(),
      ),
    );
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Opacity(
          opacity: opacity.value,
          child: Transform.translate(
            offset: Offset(translateX.value, 0),
            child: widget.child,
          ),
        );
      },
    );
  }
}
