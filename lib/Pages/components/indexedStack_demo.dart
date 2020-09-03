import 'package:flutter/material.dart';

class IndexedStackDemo extends StatefulWidget {
  IndexedStackDemo({Key key}) : super(key: key);

  @override
  _IndexedStackDemoState createState() => _IndexedStackDemoState();
}

class _IndexedStackDemoState extends State<IndexedStackDemo> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('只能展示一个子组件'),
        elevation: 0.0, //阴影大小
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text('显示第一个元素'),
                onPressed: () {
                  setState(() {
                    this.currentIndex = 0;
                  });
                },
                splashColor: Colors.grey,
                elevation: 0.0,
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                textTheme: ButtonTextTheme.primary,
              ),
              SizedBox(width: 10),
              RaisedButton(
                child: Text('显示第二个元素'),
                onPressed: () {
                  setState(() {
                    this.currentIndex = 1;
                  });
                },
                splashColor: Colors.grey,
                elevation: 0.0,
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                textTheme: ButtonTextTheme.primary,
              ),
            ],
          ),
          IndexedStack(
            index: currentIndex,
            //文本容器
            children: <Widget>[
              Container(
                width: 320,
                height: 100,
                alignment: Alignment.center,
                color: Colors.green,
                child: Text('第一个元素'),
              ),
              Container(
                width: 320,
                height: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('第二个元素'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
