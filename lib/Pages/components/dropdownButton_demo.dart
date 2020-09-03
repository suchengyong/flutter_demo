import 'package:flutter/material.dart';

class DropdownButtonDemo extends StatefulWidget {
  DropdownButtonDemo({Key key}) : super(key: key);

  @override
  _DropdownButtonDemoState createState() => _DropdownButtonDemoState();
}

class _DropdownButtonDemoState extends State<DropdownButtonDemo> {
  var _dropValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('弹出选择框'),
        elevation: 0.0, //阴影大小
      ),
      body: Column(
        children: <Widget>[
          DropdownButton(
            icon: Icon(Icons.add),
            hint: Text('请选择'),
            iconSize: 24,
            iconDisabledColor: Colors.red,
            iconEnabledColor: Colors.red,
            value: _dropValue,
            items: [
              DropdownMenuItem(
                child: Text('语文', style: TextStyle(color: Colors.red)),
                value: '语文',
              ),
              DropdownMenuItem(
                  child: Text('数学', style: TextStyle(color: Colors.green)),
                  value: '数学'),
              DropdownMenuItem(
                  child: Text('英语', style: TextStyle(color: Colors.yellow)),
                  value: '英语'),
            ],
            onChanged: (value) {
              setState(() {
                _dropValue = value;
              });
            },
          ),
          // 菜单弹出框
          PopupMenuButton<String>(
            //icon: Icon(Icons.add),
            //child: Text('学科'),
            initialValue: '语文',
            tooltip: '长按时的提示',
            onSelected: (value) {
              print('$value');
            },
            onCanceled: () {
              print('onCanceled');
            },
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10)),
            itemBuilder: (context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: '语文',
                  child: Text('语文'),
                ),
                PopupMenuItem<String>(
                  value: '数学',
                  child: Text('数学'),
                ),
                PopupMenuItem<String>(
                  value: '英语',
                  child: Text('英语'),
                ),
                PopupMenuItem<String>(
                  value: '生物',
                  child: Text('生物'),
                ),
                PopupMenuItem<String>(
                  value: '化学',
                  child: Text('化学'),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
