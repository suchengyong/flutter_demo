import 'package:flutter/material.dart';
import 'package:flutter_demo/Pages/statusComponents/Bloc_Page.dart';
import 'package:flutter_demo/Pages/statusComponents/ParentsStateChild.dart';
import 'package:flutter_demo/Pages/statusComponents/RxDartPage.dart';
import 'package:flutter_demo/Pages/statusComponents/ScopedModel.dart';
import 'package:flutter_demo/Pages/statusComponents/StateInheritedWidget.dart';
import 'package:flutter_demo/Pages/statusComponents/StateProvide.dart';
import 'package:flutter_demo/Pages/statusComponents/StreamSatePage.dart';

class StatusPage extends StatefulWidget {
  StatusPage({Key key}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('状态管理页面'),
        elevation: 0.0, //阴影大小
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text('父-子组件传参赛-状态管理'),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => StateDemoPage()),
              );
            },
          ),
          RaisedButton(
            child: Text('使用InheritedWidget状态管理使用'),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => StateInheritedWidget()),
              );
            },
          ),
          RaisedButton(
            child: Text('scoped_modal状态管理库使用'),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ScopedModelPage()),
              );
            },
          ),
          RaisedButton(
            child: Text('stream状态管理使用'),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => StreamSatePage()),
              );
            },
          ),
          RaisedButton(
            child: Text('rxDart状态管理库使用'),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => RxDartPage()),
              );
            },
          ),
          RaisedButton(
            child: Text('Bloc状态管理库使用'),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => BlocPage()),
              );
            },
          ),
          RaisedButton(
            child: Text('provide状态管理库使用'),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => StateProvidePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
