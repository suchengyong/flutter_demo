import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'KeepAlivePage.dart';

class KeepAliveDemo extends StatefulWidget {
  @override
  _KeepAliveDemoState createState() => _KeepAliveDemoState();
}

class _KeepAliveDemoState extends State<KeepAliveDemo>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
          ],
        ),
        title: Text('在多个页面中切换，并保持原页面状态'),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          KeepAlivePage(
            title: '在多个页面中切换，并保持原页面状态1',
          ),
          KeepAlivePage(
            title: '在多个页面中切换，并保持原页面状态2',
          ),
          KeepAlivePage(
            title: '在多个页面中切换，并保持原页面状态3',
          ),
        ],
      ),
    );
  }
}
