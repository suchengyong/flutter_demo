import 'package:flutter/material.dart';

class TextRichDemo extends StatelessWidget {
  const TextRichDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('富文本展示效果'),
        elevation: 0.0, //阴影大小
      ),
      body: Container(
        child: Text.rich(
          TextSpan(
            children: <InlineSpan>[
              TextSpan(text: '我是富文本中文字'),
              WidgetSpan(
                child: SizedBox(
                  width: 120,
                  height: 50,
                  child: Card(
                    child: Center(
                      child: Text('可以嵌套各种文字和图片和各种组件'),
                    ),
                  ),
                ),
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Image.asset(
                  'assets/images/2.jpg',
                  width: 60,
                  height: 60,
                ),
              ),
              TextSpan(text: '我是富文本中文字!'),
            ],
          ),
        ),
      ),
    );
  }
}
