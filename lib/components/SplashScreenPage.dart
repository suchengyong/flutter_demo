import 'package:flutter/material.dart';
import 'package:flutter_demo/TabBars/BottomTabBars.dart';

import 'ReturnHome.dart';

class SplashScreenPage extends StatefulWidget {
  final Map arguments;
  SplashScreenPage({Key key, this.arguments}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print(widget.arguments);
        if (widget.arguments != null && widget.arguments['flage'] == 1) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => ReturnHome()),
              (route) => route == null);
        } else {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => BottomTabBars()),
              (route) => route == null);
        }
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new FadeTransition(
      opacity: _animation,
      child: new Image.asset(
        'assets/images/chaonan2.jpg',
        scale: 2.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
