import 'package:flutter/material.dart';
import 'dart:async';

class ScrollerMarqueeTextPage extends StatelessWidget {
  ScrollerMarqueeTextPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("消息公告上下跑马灯"),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 20, left: 30),
        color: Colors.red,
        width: 300,
        height: 50,
        child: MarqueeText(
          count: 10,
          itemBuilder: (buildContext, index) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                "消息公告上下跑马灯展示效果----" + index.toString(),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}

// 组件
class MarqueeText extends StatefulWidget {
  final int count; // 子视图数量
  final IndexedWidgetBuilder itemBuilder; // 子视图构造器
  MarqueeText({Key key, this.count, this.itemBuilder}) : super(key: key);

  @override
  _MarqueeTextState createState() => _MarqueeTextState();
}

class _MarqueeTextState extends State<MarqueeText> {
  PageController _controller;
  Timer _timer;

  @override
  void initState() {
    super.initState();

    _controller = PageController();
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      // 如果当前位于最后一页，则直接跳转到第一页，两者内容相同，跳转时视觉上无感知
      if (_controller.page.round() >= widget.count) {
        _controller.jumpToPage(0);
      }
      _controller.nextPage(
          duration: Duration(seconds: 1), curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      controller: _controller,
      itemBuilder: (buildContext, index) {
        if (index < widget.count) {
          return widget.itemBuilder(buildContext, index);
        } else {
          return widget.itemBuilder(buildContext, 0);
        }
      },
      itemCount: widget.count + 1, // 在原数据末尾添加一笔数据(即第一笔数据)，用于实现无限循环滚动效果
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _timer.cancel();
  }
}
