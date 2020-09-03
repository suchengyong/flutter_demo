import 'package:flutter/material.dart';

class ListViewSeparatedPage extends StatefulWidget {
  ListViewSeparatedPage({Key key}) : super(key: key);

  @override
  _ListViewSeparatedPageState createState() => _ListViewSeparatedPageState();
}

class _ListViewSeparatedPageState extends State<ListViewSeparatedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ListViewSeparatedPage 页面标题'),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: ListView.separated(
                itemCount: 100,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    alignment: Alignment.center,
                    height: 100,
                    child: Text(
                      '第 $index 个',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    color: Colors
                        .primaries[index % Colors.primaries.length], //生成随机颜色,
                  );
                },
                // 分割线或者其他组件
                separatorBuilder: (BuildContext context, index) {
                  return Divider(color: Colors.white, height: 2); // 分割线组件
                })));
  }
}
