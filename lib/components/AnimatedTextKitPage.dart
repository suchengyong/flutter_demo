import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedTextKitPage extends StatefulWidget {
  AnimatedTextKitPage({Key key}) : super(key: key);

  @override
  _AnimatedTextKitPageState createState() => _AnimatedTextKitPageState();
}

class _AnimatedTextKitPageState extends State<AnimatedTextKitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文字动效组件"),
      ),
      body: Column(
        children: <Widget>[
          ListTile(title: Text("默认")),
          FadeAnimatedTextKit(
            duration: Duration(milliseconds: 5000),
            isRepeatingAnimation: true,
            text: ["文字", "动起来", "common!!!"],
            textStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          ),
          ListTile(title: Text("打字机")),
          Container(
            height: 80,
            child: TyperAnimatedTextKit(
                onTap: () {
                  print("Tap Event");
                },
                text: [
                  "学习使我快乐",
                  "切图仔最后的倔强",
                ],
                textStyle: TextStyle(fontSize: 30.0, fontFamily: "Bobbers"),
                textAlign: TextAlign.start,
                alignment: AlignmentDirectional.center // or Alignment.topLeft
                ),
          ),
          ListTile(title: Text("打字机 带光标")),
          TypewriterAnimatedTextKit(
              onTap: () {
                print("Tap Event");
              },
              text: [
                "切图仔最后的倔强",
              ],
              textStyle: TextStyle(fontSize: 30.0, fontFamily: "Agne"),
              textAlign: TextAlign.start,
              alignment: AlignmentDirectional.topStart // or Alignment.topLeft
              ),
          ListTile(title: Text("缩放")),
          SizedBox(
            width: 250.0,
            child: ScaleAnimatedTextKit(
                onTap: () {
                  print("Tap Event");
                },
                text: ["Flutter", "轮子", "推荐"],
                textStyle: TextStyle(fontSize: 70.0, fontFamily: "Canterbury"),
                textAlign: TextAlign.start,
                alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                ),
          ),
          ListTile(title: Text("颜色渐变")),
          ColorizeAnimatedTextKit(
              onTap: () {
                print("Tap Event");
              },
              text: [
                "小包子",
                "flutter",
              ],
              textStyle: TextStyle(fontSize: 32.0, fontFamily: "Horizon"),
              colors: [
                Colors.purple,
                Colors.blue,
                Colors.yellow,
                Colors.red,
              ],
              textAlign: TextAlign.start,
              alignment: AlignmentDirectional.topStart // or Alignment.topLeft
              ),
          // ListTile(title: Text("滚动")),
          // Row(
          //   //mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     RotateAnimatedTextKit(
          //       onTap: () {
          //         print("Tap Event");
          //       },
          //       text: ["小包子", "切图仔", "最后的倔强"],
          //       textStyle:
          //           TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          //       textAlign: TextAlign.justify,
          //       alignment: AlignmentDirectional.center,
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
