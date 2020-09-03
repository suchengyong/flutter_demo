import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';

class SwipeDeletePage extends StatefulWidget {
  SwipeDeletePage({Key key}) : super(key: key);

  @override
  _SwipeDeletePageState createState() => _SwipeDeletePageState();
}

class _SwipeDeletePageState extends State<SwipeDeletePage> {
  List list;

  @override
  void initState() {
    super.initState();
    list = [
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('仿微信滑动删除功能'),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (c, index) {
          return _item(index);
        },
      ),
    );
  }

  Widget _item(int index) {
    return SwipeActionCell(
      key: ObjectKey(list[index]),
      performsFirstActionWithFullSwipe: true,
      actions: <SwipeAction>[
        SwipeAction(
          title: "删除",
          widthSpace: 60,
          nestedAction: SwipeNestedAction(
            title: '确认删除',
            nestedWidth: 120,
          ),
          onTap: (CompletionHandler handler) async {
            await handler(true);
            list.removeAt(index);
            setState(() {});
          },
          color: Colors.red,
        ),
        SwipeAction(
          widthSpace: 60,
          title: "置顶",
          onTap: (CompletionHandler handler) async {
            handler(false);
            showCupertinoDialog(
              context: context,
              builder: (c) {
                return CupertinoAlertDialog(
                  title: Text('确认置顶吗'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: Text('确认'),
                      isDestructiveAction: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
          color: Colors.orange,
        ),
      ],
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border(
            // 下边框
            bottom: BorderSide(
              color: Colors.grey[300],
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
        ),
        child: Text(
          "this is index of ${list[index]}",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
