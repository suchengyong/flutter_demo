import 'package:flutter/material.dart';

class SingleChildScrollViewDemo extends StatelessWidget {
  const SingleChildScrollViewDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('可滚动组件'),
        elevation: 0.0,
      ),
      body: Container(
        height: 350.0,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(10),
          child: ListBody(
            // 对齐方式
            mainAxis: Axis.horizontal,
            // 内容是否反向
            reverse: false,
            children: [
              Container(color: Colors.red, width: 200.0, height: 150.0),
              Container(color: Colors.blue, width: 150.0, height: 150.0),
              Container(color: Colors.yellow, width: 280.0, height: 150.0),
              Container(color: Colors.orange, width: 180.0, height: 150.0),
              Container(color: Colors.green, width: 200.0, height: 150.0),
            ],
          ),
        ),
      ),
    );
  }
}
