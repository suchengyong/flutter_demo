import 'package:flutter/material.dart';

class ArgumentsFulPage extends StatefulWidget {
  final Map arguments;
  ArgumentsFulPage({Key key, this.arguments}) : super(key: key);

  @override
  _ArgumentsFulPageState createState() =>
      _ArgumentsFulPageState(arguments: this.arguments);
}

class _ArgumentsFulPageState extends State<ArgumentsFulPage> {
  Map arguments;
  _ArgumentsFulPageState({this.arguments});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('有状态组件传递参数')),
      body: Center(
        child: Text("有状态组件传递参数是：${arguments['title']}"),
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
