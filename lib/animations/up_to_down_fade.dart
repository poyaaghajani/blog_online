import 'package:flutter/material.dart';

class UpToDownFade extends StatefulWidget {
  final Widget child;
  final double dely;
  UpToDownFade({Key? key, required this.child, required this.dely})
      : super(key: key);

  @override
  State<UpToDownFade> createState() => _UpToDownFadeState();
}

class _UpToDownFadeState extends State<UpToDownFade>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> opacity;
  late Animation<double> translateY;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    opacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.ease),
    );
    translateY = Tween(begin: -40.0, end: 0.0).animate(
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
            offset: Offset(0, translateY.value),
            child: widget.child,
          ),
        );
      },
    );
  }
}
