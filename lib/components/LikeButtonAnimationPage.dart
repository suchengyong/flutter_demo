import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class LikeButtonAnimationPage extends StatefulWidget {
  LikeButtonAnimationPage({Key key}) : super(key: key);

  @override
  _LikeButtonAnimationPageState createState() =>
      _LikeButtonAnimationPageState();
}

class _LikeButtonAnimationPageState extends State<LikeButtonAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("点赞按钮动画"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text("默认效果："),
              LikeButton(),
            ],
          ),
          Column(
            children: <Widget>[Text("带数字："), LikeButton(likeCount: 520)],
          ),
          Column(
            children: <Widget>[
              Text("自定义图标："),
              LikeButton(
                likeBuilder: (bool isLiked) {
                  return Icon(Icons.person);
                },
              )
            ],
          ),
          Column(
            children: <Widget>[
              Text("自定义图标+数字："),
              LikeButton(
                  likeBuilder: (bool isLiked) {
                    return Icon(Icons.person);
                  },
                  likeCount: 520)
            ],
          ),
          Column(
            children: <Widget>[
              Text("自定义图标+自定义颜色+数字："),
              LikeButton(
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.person,
                      color: isLiked ? Colors.blue : Colors.grey,
                    );
                  },
                  likeCount: 520)
            ],
          ),
          Column(
            children: <Widget>[
              Text("自定义图标+自定义泡泡颜色+数字："),
              LikeButton(
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Icons.person,
                    color: isLiked ? Colors.blue : Colors.grey,
                  );
                },
                likeCount: 520,
                circleColor: CircleColor(
                    start: Color(0xff00ddff), end: Color(0xff0099cc)),
                bubblesColor: BubblesColor(
                  dotPrimaryColor: Color(0xff33b5e5),
                  dotSecondaryColor: Color(0xff0099cc),
                ),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Text("自定义图标+自定义泡泡颜色+数字修饰："),
              LikeButton(
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.person,
                      color: isLiked ? Colors.blue : Colors.grey,
                    );
                  },
                  likeCount: 520,
                  circleColor: CircleColor(
                      start: Color(0xff00ddff), end: Color(0xff0099cc)),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Color(0xff33b5e5),
                    dotSecondaryColor: Color(0xff0099cc),
                  ),
                  countBuilder: (int count, bool isLiked, String text) {
                    var color = isLiked ? Colors.red : Colors.grey;
                    Widget result;
                    result = Text(
                      text,
                      style: TextStyle(color: color, fontSize: 20),
                    );
                    return result;
                  },
                  countDecoration: (Widget count) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        count,
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "loves",
                          style: TextStyle(color: Colors.indigoAccent),
                        )
                      ],
                    );
                  })
            ],
          )
        ],
      ),
    );
  }
}
