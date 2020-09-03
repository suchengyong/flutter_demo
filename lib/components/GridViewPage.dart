import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  GridViewPage({Key key}) : super(key: key);

  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GridView 页面标题'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: GridGenerate(),
        ));
  }
}

// 普通用法
class GridViewItem extends StatelessWidget {
  const GridViewItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      // 表示3个一列排列
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      children: <Widget>[
        Container(
          height: 180,
          color: Colors.red,
        ),
        Container(
          height: 280,
          color: Colors.yellow,
        ),
        Container(
          height: 380,
          color: Colors.green,
        ),
        Container(
          height: 480,
          color: Colors.orange,
        ),
        Container(
          height: 580,
          color: Colors.red[600],
        ),
        Container(
          height: 180,
          color: Colors.red,
        ),
        Container(
          height: 280,
          color: Colors.yellow,
        ),
        Container(
          height: 380,
          color: Colors.green,
        ),
      ],
    );
  }
}

// 生成器 生成用法
class GridGenerate extends StatelessWidget {
  const GridGenerate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        // 表示3个一列排列
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        // 使用生成器生成widget
        children: List.generate(
            50,
            (index) => Container(
                  alignment: Alignment.center,
                  height: 80,
                  margin: EdgeInsets.only(bottom: 5, right: 5),
                  child: Text(
                    '第 $index 个',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  color: Colors
                      .primaries[index % Colors.primaries.length], //生成随机颜色,
                )));
  }
}
