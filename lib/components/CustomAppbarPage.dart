import 'package:flutter/material.dart';

class CustomAppbarPage extends StatelessWidget {
  const CustomAppbarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('顶部导航'),
        centerTitle: true, //标题是否居中显示
        backgroundColor: Colors.red, //导航背景颜色
        //leading: Icon(Icons.menu),//在导航前面添加图标
        leading: IconButton(
          //在导航前面添加图标,和监听它点击事件
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.of(context).pop();
            print('监听点击了');
          },
        ),
        actions: <Widget>[
          //在导航栏后面添加图标
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.of(context).pop();
                print('监听点击了');
              }),
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                print('监听点击了');
              })
        ],
      ),
      body: Text('顶部导航内容'),
    );
  }
}
