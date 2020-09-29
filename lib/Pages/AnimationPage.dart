import 'package:flutter/material.dart';
import 'package:flutter_demo/Pages/animation/AnimatedCrossFadeDemo.dart';
import 'package:flutter_demo/Pages/animation/basic_structure_hero.dart';
import 'package:flutter_demo/Pages/animation/navigate_screen_animation.dart';
import 'package:flutter_demo/Pages/animation/photo_hero.dart';
import 'package:flutter_demo/Pages/animation/spinkit_page.dart';

import 'animation/LoginBackgroundAnimationPage.dart';
import 'animation/RouterAnimationPage.dart';
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
              '登录页面背景动画效果',
              textAlign: TextAlign.center,
            ),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => LoginBackgroundAnimationPage()),
              );
            },
          ),
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
          RaisedButton(
            child: Text(
              '神奇的Hero动画-图片飞动画',
              textAlign: TextAlign.center,
            ),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => PhotoHeroPage()),
              );
            },
          ),
          RaisedButton(
            child: Text(
              '结构变化-神奇的Hero动画',
              textAlign: TextAlign.center,
            ),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => BasicStructureHeroPage()),
              );
            },
          ),
          RaisedButton(
            child: Text(
              'Ripple路由转换动画',
              textAlign: TextAlign.center,
            ),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => NavigateScreenAnimation()),
              );
            },
          ),
          RaisedButton(
            child: Text(
              'AnimationCrossFade能够让我们在两个不同的Widget中进行淡化过渡',
              textAlign: TextAlign.center,
            ),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => AnimatedCrossFadeDemo()),
              );
            },
          ),
          RaisedButton(
            child: Text(
              '一个很棒的等待动画库——Spinkit',
              textAlign: TextAlign.center,
            ),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SpinkitPage()),
              );
            },
          ),
          RaisedButton(
            child: Text(
              '路由跳转动画效果实现',
              textAlign: TextAlign.center,
            ),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => RouterAnimationPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
