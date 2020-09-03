import 'package:flutter/material.dart';

class ListViewBuilderPage extends StatefulWidget {
  ListViewBuilderPage({Key key}) : super(key: key);

  @override
  _ListViewBuilderPageState createState() => _ListViewBuilderPageState();
}

class _ListViewBuilderPageState extends State<ListViewBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('listViewBuilder 页面标题'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: 100,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  alignment: Alignment.center,
                  height: 100,
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    '第 $index 个',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  color: Colors
                      .primaries[index % Colors.primaries.length], //生成随机颜色,
                );
              }),
        ));
  }
}
