import 'package:flutter/material.dart';

class DragSortPage extends StatefulWidget {
  DragSortPage({Key key}) : super(key: key);

  @override
  _DragViewPageState createState() => _DragViewPageState();
}

class _DragViewPageState extends State<DragSortPage> {
  List<String> items = List.generate(20, (int i) => '$i');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('列表拖拽排序'),
        ),
        body: Container(
          width: double.infinity,
          child: ReorderableListView(
            children: <Widget>[
              for (String item in items)
                Container(
                  key: ValueKey(item),
                  height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors
                          .primaries[int.parse(item) % Colors.primaries.length],
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child: Text(
                    '$item',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                )
            ],
            onReorder: (int oldIndex, int newIndex) {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              var child = items.removeAt(oldIndex);
              print(child);
              items.insert(newIndex, child);
              print(items);
              setState(() {});
            },
          ),
        ));
  }
}
