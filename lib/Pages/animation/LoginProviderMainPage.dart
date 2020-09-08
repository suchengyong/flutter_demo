import 'dart:async';

import 'package:flutter/material.dart';

class LoginProviderMainPage extends State<StatefulWidget>
    with ChangeNotifier, TickerProviderStateMixin {
  Animation<double> backgroundAnimation;
  AnimationController backgroundController;
  double opacityMain = 1.0;
  double opacityToChange = 0.0;
  int index = 0;
  int indexChange = 1;
  List<String> imgList = [
    'assets/images/chaonan1.jpeg',
    'assets/images/chaonan2.jpg',
    'assets/images/chaonan3.jpeg',
    'assets/images/chaonan4.jpeg'
  ];
  //定义一个定时器
  Timer interval;
  LoginProviderMainPage() {
    backgroundController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000)); // 动画执行时间500毫秒
    backgroundAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(backgroundController);
    // 监听动画执行过程
    backgroundAnimation.addListener(() {
      opacityMain = 1 - backgroundAnimation.value;
      opacityToChange = backgroundAnimation.value;
      notifyListeners();
    });
    // 监听动画状态
    backgroundAnimation.addStatusListener((status) {
      // 如果动画完成
      if (status == AnimationStatus.completed) {
        index = index + 1;
        indexChange = indexChange + 1;
        if (index == imgList.length) {
          index = 0;
        }
        if (indexChange == imgList.length) {
          indexChange = 0;
        }
        opacityMain = 1.0;
        opacityToChange = 0.0;
        notifyListeners();
      }
    });
    //定义一个定时器 类似js 里面的setInterval一样；定义5秒执行一次动画
    interval = Timer.periodic(Duration(seconds: 5), (timer) {
      backgroundController.forward(from: 0);
    });
  }
  @override
  void dispose() {
    // 消毁定时器
    interval.cancel();
    // 销毁停止动画
    backgroundController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {}
}
