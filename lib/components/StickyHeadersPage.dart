import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class StickyHeadersPage extends StatefulWidget {
  StickyHeadersPage({Key key}) : super(key: key);

  @override
  _StickyHeadersPageState createState() => _StickyHeadersPageState();
}

class _StickyHeadersPageState extends State<StickyHeadersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滚动粘贴效果'),
        elevation: 0.0, // 头部阴影效果
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return StickyHeader(
          header: Container(
            height: 50.0,
            color: Colors.blueGrey[700],
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              '滚动粘贴数字 $index',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          content: Container(
            child: Image.asset(
              'assets/images/chaonan2.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 500.0,
            ),
          ),
        );
      }),
    );
  }
}
