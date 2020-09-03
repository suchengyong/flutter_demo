import 'package:flutter/material.dart';

class ScreenPage extends StatefulWidget {
  @override
  _ScreenPageState createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        // 翻滚方向
        scrollDirection: Axis.vertical,
        //reverse: true, //反转
        controller: PageController(
          //不沾满屏
          viewportFraction: 1,
        ),
        onPageChanged: (int index) {
          //切换改变触发
        },
        children: [
          Container(
            color: Colors.red,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 80,
                  right: 30,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    '这是第一页',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.orange,
            child: Center(
                child: Text(
              '这是第二页',
              style: TextStyle(color: Colors.white, fontSize: 30),
            )),
          ),
          Container(
            color: Colors.green,
            child: Center(
                child: Text(
              '这是第三页',
              style: TextStyle(color: Colors.white, fontSize: 30),
            )),
          ),
          Container(
            color: Colors.yellow,
            child: Center(
                child: Text(
              '这是第四页',
              style: TextStyle(color: Colors.white, fontSize: 30),
            )),
          ),
          Container(
            color: Colors.teal,
            child: Center(
                child: Text(
              '这是第五页',
              style: TextStyle(color: Colors.white, fontSize: 30),
            )),
          )
        ],
      ),
    );
  }
}
