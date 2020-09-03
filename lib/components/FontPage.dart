import 'package:flutter/material.dart';

class FontPage extends StatefulWidget {
  FontPage({Key key}) : super(key: key);

  @override
  _FontPageState createState() => _FontPageState();
}

class _FontPageState extends State<FontPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义字体'),
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: 200,
          margin: EdgeInsets.only(top: 20),
          color: Colors.red,
          child: Text(
            '自定义字体的使用展示',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'MaShanZheng',
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
