import 'package:flutter/material.dart';

class AspectRatioDemo extends StatelessWidget {
  const AspectRatioDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('调整子组件宽高比'),
      ),
      body: AspectRatio(
        aspectRatio: 4.0 / 2.0,
        child: Container(
          color: Color.fromRGBO(3, 54, 255, 1.0),
          alignment: Alignment.center,
          child: Text(
            '调整子组件宽高比',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
