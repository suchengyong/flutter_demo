/// 这是一个捕获页面被回pop掉的demo，通过切换main中的import查看不同页面。
/// 其中包含使用WillPopScope实现提示dialog与form自带的dialog页面信息
/// 每个demo前已注明实现原理
/// 实现原理，使用WillPopScope组件，它会检测到子组件的Navigation的pop事件，并拦截下来。
/// 我们需要在它的onWillPop属性中返回一个新的组件（一般是一个Dialog）处理是否真的pop该页面。

import 'dart:async';

import 'package:flutter/material.dart';

class WillPopScpoeDemo extends StatefulWidget {
  WillPopScpoeDemo({Key key}) : super(key: key);

  @override
  _WillPopScpoeDemoState createState() => new _WillPopScpoeDemoState();
}

class _WillPopScpoeDemoState extends State<WillPopScpoeDemo> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('返回上一页时弹出提示信息'),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'You have pushed the button this many times:',
              ),
              new Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('您真的要退出该应用程序吗?'),
        actions: <Widget>[
          FlatButton(
            child: Text('取消'),
            onPressed: () => Navigator.pop(context, false),
          ),
          FlatButton(
            child: Text('确定'),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );
  }
}
