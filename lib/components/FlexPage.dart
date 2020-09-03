import 'package:flutter/material.dart';

class FlexPage extends StatefulWidget {
  FlexPage({Key key}) : super(key: key);

  @override
  _FlexPageState createState() => _FlexPageState();
}

class _FlexPageState extends State<FlexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('flex 布局')),
        body: Container(
          height: double.infinity, //高度和屏幕高度一样
          color: Colors.grey,
          child: Flex(
            direction: Axis.horizontal, //水平方向
            mainAxisAlignment: MainAxisAlignment.spaceAround, //主轴对齐方式
            mainAxisSize: MainAxisSize.max, //主轴的大小
            crossAxisAlignment: CrossAxisAlignment.center, // 交叉轴对齐方式
            textDirection: TextDirection.rtl, // 主轴方向的布局排列顺序
            verticalDirection: VerticalDirection.up, // 交叉轴方向的布局排列顺序
            textBaseline: TextBaseline.alphabetic, // 子项目使用那个基线
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                color: Colors.red,
              ),
              Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                color: Colors.green,
              ),
              Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                color: Colors.orange,
              )
            ],
          ),
        ));
  }
}
