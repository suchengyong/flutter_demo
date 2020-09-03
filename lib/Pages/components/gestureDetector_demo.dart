import 'package:flutter/material.dart';

class GestureDetectorDemo extends StatelessWidget {
  const GestureDetectorDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手势事件'),
        elevation: 0.0, //阴影大小
      ),
      body: GestureDetector(
        onTapDown: (TapDownDetails tapDownDetails) {
          print('onTapDown');
        },
        onTapUp: (TapUpDetails tapUpDetails) {
          print('onTapUp');
        },
        onTap: () {
          print('onTap');
        },
        onTapCancel: () {
          print('onTapCancel');
        },
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
            child: Text('手势检测触发事件'),
          ),
        ),
      ),
    );
  }
}
