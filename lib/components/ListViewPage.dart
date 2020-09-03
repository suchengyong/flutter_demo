import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  ListViewPage({Key key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ListView 页面标题'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: ListGenerate(),
        ));
  }
}

// 普通用法
class ListViewItem extends StatelessWidget {
  const ListViewItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
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
        )
      ],
    );
  }
}

// 生成器 生成用法
class ListGenerate extends StatelessWidget {
  const ListGenerate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        // 使用生成器生成widget
        children: List.generate(
            50,
            (index) => Container(
                  alignment: Alignment.center,
                  height: 80,
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    '第 $index 个',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  color: Colors
                      .primaries[index % Colors.primaries.length], //生成随机颜色,
                )));
  }
}
