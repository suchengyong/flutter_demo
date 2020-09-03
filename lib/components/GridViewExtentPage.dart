import 'package:flutter/material.dart';

class GridViewExtentPage extends StatefulWidget {
  GridViewExtentPage({Key key}) : super(key: key);

  @override
  _GridViewExtentPageState createState() => _GridViewExtentPageState();
}

class _GridViewExtentPageState extends State<GridViewExtentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GridViewExtent 页面标题'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: GridView.extent(
            crossAxisSpacing: 5, // 每一列之间距离
            mainAxisSpacing: 10, // 没一行之间距离
            // 最大列宽显示
            maxCrossAxisExtent: 200,
            children: <Widget>[
              Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text(
                    '第 1 个',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
              Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text(
                    '第 2 个',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
              Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text(
                    '第 3 个',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
              Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text(
                    '第 4 个',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
              Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text(
                    '第 5 个',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
              Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text(
                    '第 6 个',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
              Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text(
                    '第 7 个',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
              Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text(
                    '第 1 个',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
              Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text(
                    '第 2 个',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
              Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text(
                    '第 3 个',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
              Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text(
                    '第 4 个',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
              Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text(
                    '第 5 个',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
              Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text(
                    '第 6 个',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
              Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text(
                    '第 7 个',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ))
            ],
          ),
        ));
  }
}
