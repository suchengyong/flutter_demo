import 'package:flutter/material.dart';
import 'widgets/MarqueeWidget.dart';
import 'package:marquee/marquee.dart';

class MarqueeWidgetPage extends StatelessWidget {
  MarqueeWidgetPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("跑马灯"),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.blueGrey,
            height: 30,
            child: MarqueeWidget(
              text: "跑马灯效果公告滚动播放案例很多很多文字哦哦哦哦很多很多文字哦哦哦哦",
              textStyle: new TextStyle(fontSize: 16.0),
              scrollAxis: Axis.horizontal,
              ratioOfBlankToScreen: 1,
            ),
          ),
          Container(
            color: Colors.red,
            height: 30,
            child: Marquee(
              text: '跑马灯效果公告滚动播放案例很多很多文字哦哦哦哦很多很多',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              blankSpace: 20.0,
              velocity: 100.0,
              pauseAfterRound: Duration(seconds: 0),
              startPadding: 10.0,
              accelerationDuration: Duration(seconds: 3),
              accelerationCurve: Curves.ease,
              decelerationDuration: Duration(milliseconds: 1000),
              decelerationCurve: Curves.ease,
            ),
          )
        ],
      ),
    );
  }
}
