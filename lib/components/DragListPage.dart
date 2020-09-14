import 'package:drag_list/drag_list.dart';
import 'package:flutter/material.dart';

class DragListPage extends StatefulWidget {
  DragListPage({Key key}) : super(key: key);

  @override
  _DragListPageState createState() => _DragListPageState();
}

class _DragListPageState extends State<DragListPage> {
  List<String> data = ['1', '2', '3', '4', '5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("拖动排序元素"),
      ),
      body: Column(
        children: <Widget>[
          ListTile(title: Text('纵向')),
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            child: DragList<String>(
              items: data,
              itemExtent: 72.0,
              itemBuilder: (context, item, handle) {
                return Container(
                  height: 72.0,
                  child: Row(children: [
                    Spacer(),
                    Text(item.value),
                    Spacer(),
                    handle,
                  ]),
                );
              },
            ),
          ),
          ListTile(title: Text('横向+自定义拖动点组件+修改源数据')),
          Container(
            height: 100,
            child: DragList<String>(
              items: data,
              itemExtent: 100,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, item, handle) {
                return Container(
                  height: 100.0,
                  width: 100,
                  child: Row(children: [
                    Spacer(),
                    Text(item.value),
                    Spacer(),
                    handle,
                  ]),
                );
              },
              handleBuilder: (_) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Icon(Icons.arrow_forward),
                );
              },
              onItemReorder: (from, to) {
                var temp = data[from];
                data[from] = data[to];
                data[to] = temp;
                setState(() {});
              },
            ),
          ),
          Center(
            child: Text(data.toString()),
          ),
          ListTile(title: Text('不设置拖动点：组件本体拖动')),
          Container(
            height: 100,
            child: DragList<String>.handleless(
              items: data,
              itemExtent: 100,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, item) {
                return Container(
                  height: 100.0,
                  width: 100,
                  child: Row(children: [
                    Spacer(),
                    Text(item.value),
                    Spacer(),
                  ]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
