import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  MyPage({Key key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的页面'),
        elevation: 0.0, //阴影大小
      ),
      body: Text('我的页面'),
    );
  }
}
