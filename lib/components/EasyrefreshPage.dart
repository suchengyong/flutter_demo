import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class EasyrefreshPage extends StatefulWidget {
  EasyrefreshPage({Key key}) : super(key: key);

  @override
  _EasyrefreshPageState createState() => _EasyrefreshPageState();
}

class _EasyrefreshPageState extends State<EasyrefreshPage> {
  EasyRefreshController _controller;
  // 条目总数
  int _count = 20;
  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('上拉加载和下拉刷新')),
      body: EasyRefresh.custom(
        enableControlFinishRefresh: false,
        enableControlFinishLoad: true,
        controller: _controller,
        header: ClassicalHeader(),
        footer: ClassicalFooter(),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            print('onRefresh');
            setState(() {
              _count = 20;
            });
            _controller.resetLoadState();
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            print('onLoad');
            setState(() {
              _count += 10;
            });
            _controller.finishLoad(noMore: _count >= 40);
          });
        },
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  width: 60.0,
                  height: 60.0,
                  child: Center(
                    child: Text('第$index个数据'),
                  ),
                  color: index % 2 == 0 ? Colors.grey[300] : Colors.transparent,
                );
              },
              childCount: _count,
            ),
          ),
        ],
      ),
      persistentFooterButtons: <Widget>[
        FlatButton(
          onPressed: () {
            _controller.callRefresh();
          },
          child: Text("下拉刷新", style: TextStyle(color: Colors.black)),
        ),
        FlatButton(
          onPressed: () {
            _controller.callLoad();
          },
          child: Text("上拉加载更多", style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
