import 'package:flutter/material.dart';

class GridViewCountPage extends StatefulWidget {
  GridViewCountPage({Key key}) : super(key: key);

  @override
  _GridViewCountPageState createState() => _GridViewCountPageState();
}

class _GridViewCountPageState extends State<GridViewCountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GridViewCount 页面标题'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: GridView.count(
              crossAxisCount: 3, // 生成多少个一行
              crossAxisSpacing: 5, // 每一列之间距离
              mainAxisSpacing: 10, // 没一行之间距离
              children: List.generate(
                  // 生成器 生成用法
                  50,
                  (index) => Container(
                        alignment: Alignment.center,
                        height: 80,
                        child: Text(
                          '第 $index 个',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        color: Colors.primaries[
                            index % Colors.primaries.length], //生成随机颜色,
                      ))),
        ));
  }
}
