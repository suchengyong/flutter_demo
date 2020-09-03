import 'package:flutter/material.dart';
import 'package:flutter_demo/Icons/Iconfont.dart';

class IconsPage extends StatefulWidget {
  IconsPage({Key key}) : super(key: key);

  @override
  _IconsPageState createState() => _IconsPageState();
}

class _IconsPageState extends State<IconsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义阿里图标库'),
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 250,
          height: 60,
          margin: EdgeInsets.only(top: 20),
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '自定义阿里图标 icon 的使用展示',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Icon(
                Iconfont.test4,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
