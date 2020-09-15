import 'package:flutter/material.dart';
import 'navigate_animation.dart';

class NavigateScreenAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由转换动画第一个页面'),
      ),
      body: Center(
        child: NavigateAnimation(
          nextScreen: SecondScreen(),
          color: Colors.blueAccent,
          splashColor: Colors.blueAccent,
        ),
      ),
      floatingActionButton: NavigateAnimation(
        nextScreen: SecondScreen(),
        color: Colors.white,
        splashColor: Colors.white,
        iconColor: Colors.black,
        heroTag: 'blue',
        rangeFactor: 2.4,
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由转换动画第二个页面'),
      ),
    );
  }
}
