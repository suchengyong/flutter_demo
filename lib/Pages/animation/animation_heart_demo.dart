import 'package:flutter/material.dart';

class AnimationHeartDemo extends StatelessWidget {
  const AnimationHeartDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画使用'),
        elevation: 0.0, //阴影大小
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
  AnimationController animationDemoController;
  Animation animation;
  Animation animationColor;
  CurvedAnimation curve; // 设置动画曲线
  // 初始化生命周期
  @override
  void initState() {
    super.initState();
    animationDemoController = AnimationController(
      // 使用Tween来设置动画值的时候下面属性就不需要在设置
      // value: 32.0, //设置初始的值
      // lowerBound: 32.0, // 设置起始的值
      // upperBound: 100.0, // 设置结束的值
      // 控制动画执行的时间 1000毫秒
      duration: Duration(milliseconds: 3000),
      // 该属性作用就是防止屏幕外的消耗不必要的资源
      // TickerProviderStateMixin 在绘制完每一帧做出反应
      vsync: this,
    );

    // 设置动画需要的范围的值
    // animation = Tween(begin: 32.0, end: 100.0).animate(animationDemoController);
    // 设置颜色
    // animationColor = ColorTween(begin: Colors.red, end: Colors.green).animate(animationDemoController);

    // 设置动画运动曲线，是快还是慢，还是先慢后快，等等。
    curve = CurvedAnimation(
        parent: animationDemoController, curve: Curves.bounceInOut);
    // 设置动画需要的范围的值和运动曲线
    animation = Tween(begin: 32.0, end: 100.0).animate(curve);
    // 设置颜色和运动曲线
    animationColor =
        ColorTween(begin: Colors.red, end: Colors.green).animate(curve);

    // 监听动画
    animationDemoController.addListener(() {
      print('输出每一帧动画的值：${animationDemoController.value}');
      setState(() {});
    });
    // 监听动画运行的状态
    animationDemoController.addStatusListener((AnimationStatus status) {
      print('输出动画的运行状态：$status');
    });
    // 开始播放动画
    //animationDemoController.forward();
  }

  // 卸载生命周期
  @override
  void dispose() {
    super.dispose();
    // 卸载不需要的动画
    animationDemoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView(
      children: [
        ActionChip(
          label: Text('输出每一帧动画的值：${animationDemoController.value}'),
          onPressed: () {
            // 点击开始执行一次动画
            animationDemoController.forward();
          },
        ),
        ActionChip(
          label: Text('使用Tween设置动画的值：${animation.value}'),
          onPressed: () {
            // 点击开始执行一次动画
            animationDemoController.forward();
          },
        ),
        AnimatedHeart(
          animations: [
            animation,
            animationColor,
          ],
          controller: animationDemoController,
        )
      ],
    ));
  }
}

class AnimatedHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;
  AnimatedHeart({this.animations, this.controller})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite),
      color: animations[1].value, // 设置颜色
      iconSize: animations[0].value, // 使用Tween设置图标大小
      //iconSize: animationDemoController.value, // 设置图标大小
      onPressed: () {
        // 判断动画的状态
        switch (controller.status) {
          case AnimationStatus.completed: // 动画完成
            //倒退播放动画
            controller.reverse();
            break;
          default:
            controller.forward();
        }
      },
    );
  }
}
