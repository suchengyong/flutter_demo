import 'package:flutter/material.dart';

import 'animation/animation_demo.dart';
import 'animation/animation_heart_demo.dart';

class AnimationPage extends StatefulWidget {
  AnimationPage({Key key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画使用'),
        elevation: 0.0, //阴影大小
      ),
      body: ListView(
        children: [
          RaisedButton(
            child: Text(
              '心跳动动画',
              textAlign: TextAlign.center,
            ),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AnimationDemo()),
              );
            },
          ),
          RaisedButton(
            child: Text(
              '单独封装心跳动动画',
              textAlign: TextAlign.center,
            ),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AnimationHeartDemo()),
              );
            },
          ),
        ],
      ),
    );
  }
}
