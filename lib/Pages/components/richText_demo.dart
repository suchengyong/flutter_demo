import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextDemo extends StatelessWidget {
  const RichTextDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('富文本展示效果'),
        elevation: 0.0, //阴影大小
      ),
      body: Container(
        child: RichText(
          text: TextSpan(
            text: '登录代表同意',
            style: TextStyle(color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: '《***用户协议》',
                style: TextStyle(color: Colors.red),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('点击了***用户协议');
                  },
              ),
              TextSpan(text: ' 和 ', style: TextStyle(color: Colors.black)),
              TextSpan(
                text: '《隐私政策》',
                style: TextStyle(color: Colors.red),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('点击了隐私政策');
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
