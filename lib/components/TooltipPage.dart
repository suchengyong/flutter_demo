import 'package:flutter/material.dart';

class TooltipPage extends StatelessWidget {
  const TooltipPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('按下提示信息效果'),
        elevation: 0.0, //阴影大小
      ),
      body: Center(
        child: Tooltip(
          message: '这个是按下的提示信息',
          child: Image.network(
            'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3224083421,2188580549&fm=26&gp=0.jpg',
          ),
        ),
      ),
    );
  }
}
