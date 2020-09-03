import 'package:flutter/material.dart';

class WrapPage extends StatefulWidget {
  WrapPage({Key key}) : super(key: key);

  @override
  _WrapPageState createState() => _WrapPageState();
}

class _WrapPageState extends State<WrapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('wrap 布局')),
        body: Container(
          width: double.infinity,
          height: double.infinity, //高度和屏幕高度一样
          color: Colors.white,
          child: Wrap(
            direction: Axis.horizontal, //水平方向
            alignment: WrapAlignment.center, // 主轴方向对齐方式
            runAlignment: WrapAlignment.start, // 交叉轴方向对齐方式
            runSpacing: 20, //交叉轴之间间距
            children: <Widget>[
              Chip(
                label: Text('标签名称1'),
                avatar: Icon(Icons.home, color: Colors.white),
                backgroundColor: Colors.orange,
                deleteIconColor: Colors.white,
                onDeleted: () {
                  // 删除标签
                  print("大英雄");
                },
              ),
              Chip(
                label: Text('标签名称1'),
                backgroundColor: Colors.red,
              ),
              Chip(
                label: Text('标签名称1'),
                backgroundColor: Colors.orange,
              ),
              Chip(
                label: Text('标签名称1'),
                backgroundColor: Colors.green,
                deleteIcon: Icon(Icons.home),
              ),
              Chip(
                label: Text('标签名称1'),
                backgroundColor: Colors.orange,
              ),
              Chip(
                label: Text('标签名称1'),
                backgroundColor: Colors.red,
              ),
              Chip(
                label: Text('标签名称1'),
                backgroundColor: Colors.orange,
              ),
              Container(
                  // width: 200,
                  // height: 200,
                  color: Colors.green[100],
                  child: Align(
                      // 因为FlutterLogo的宽高为60，则Align的最终宽高都为2*60=120
                      widthFactor: 2,
                      heightFactor: 2,
                      alignment: Alignment.center,
                      child: FlutterLogo(size: 60)))
            ],
          ),
        ));
  }
}
