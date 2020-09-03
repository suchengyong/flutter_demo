import 'package:flutter/material.dart';

class ConstrainedBoxDemo extends StatelessWidget {
  const ConstrainedBoxDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('约束最大最小宽高'),
        elevation: 0.0,
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 200.0,
          maxWidth: 300.0,
        ),
        child: Container(
          height: 80, //最小高200设置小于200值不起作用
          alignment: Alignment.center,
          color: Color.fromRGBO(3, 54, 255, 1.0),
          child: Text(
            '约束最大最小宽高',
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
