import 'package:flutter/material.dart';

class ArgumentsLessPage extends StatelessWidget {
  final Map arguments;
  const ArgumentsLessPage({Key key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('无状态组件传递参数')),
      body: Center(
        child: Text("无状态组件传递参数是：${arguments['title']}"),
      ),
      floatingActionButton: FloatingActionButton(
        //浮动按钮
        child: Text('返回'),
        onPressed: () {
          Navigator.of(context).pop(); //返回上一级页面
        },
      ),
    );
  }
}
