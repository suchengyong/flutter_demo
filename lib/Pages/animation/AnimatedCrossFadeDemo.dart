import 'package:flutter/material.dart';

///AnimationCrossFade能够让我们在两个不同的Widget中进行淡化过渡
///它需要传递四个参数：
///Duration：动画过渡时间
///firstChild：第一个child Widget
///SecondChild：第二个child Widget
///crossFadeState：用于切换当前显示的是第一个childWidget还是第二个childWidget

class AnimatedCrossFadeDemo extends StatefulWidget {
  @override
  _AnimatedCrossFadeDemoState createState() => _AnimatedCrossFadeDemoState();
}

class _AnimatedCrossFadeDemoState extends State<AnimatedCrossFadeDemo> {
  bool _first = false;

  change() {
    setState(() {
      _first = _first ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('淡化过渡'),
        elevation: 0.0, //阴影大小
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: change,
          child: AnimatedCrossFade(
            duration: const Duration(seconds: 2),
            firstChild: const FlutterLogo(
                style: FlutterLogoStyle.horizontal, size: 200.0),
            secondChild:
                const FlutterLogo(style: FlutterLogoStyle.stacked, size: 200.0),
            crossFadeState:
                _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          ),
        ),
      ),
    );
  }
}
