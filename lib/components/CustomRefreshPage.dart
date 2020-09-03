import 'package:flutter/material.dart';

class CustomRefreshPage extends StatefulWidget {
  CustomRefreshPage({Key key}) : super(key: key);

  @override
  _CustomRefreshPageState createState() => _CustomRefreshPageState();
}

class _CustomRefreshPageState extends State<CustomRefreshPage> {
  ScrollController _controller = new ScrollController();
  var _items = new List<String>();
  var _mPage = 0;
  @override
  void initState() {
    super.initState();
    getData();
    //给_controller添加监听
    _controller.addListener(() {
      //判断是否滑动到了页面的最底部
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        //如果不是最后一页数据，则生成新的数据添加到list里面
        if (_mPage < 4) {
          _retrieveData();
        }
      }
    });
  }

  void getData() {
    //初始数据源
    for (int i = 0; i < 20; i++) {
      _items.insert(_items.length, "第${_items.length}条原始数据");
      print(_items[i]);
    }
  }

  void _retrieveData() {
    //上拉加载新的数据
    _mPage++;
    Future.delayed(Duration(seconds: 1)).then((e) {
      for (int i = 0; i < 10; i++) {
        _items.insert(_items.length, "这是新加载的第${_items.length}条数据");
      }
      setState(() {});
    });
  }

  //下拉刷新
  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        _mPage = 0;
        _items.clear();
        for (int i = 0; i < 20; i++) {
          _items.insert(_items.length, "第${_items.length}条下拉刷新后的数据");
        }
      });
    });
  }

  @override
  void dispose() {
    //移除监听，防止内存泄漏
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('上拉加载和下拉刷新')),
      body: new RefreshIndicator(
        onRefresh: _onRefresh,
        child: new ListView.separated(
            controller: _controller,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              //判断是否构建到了最后一条item
              if (index == _items.length) {
                //判断是不是最后一页
                if (_mPage < 4) {
                  //不是最后一页，返回一个loading窗
                  return new Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: CircularProgressIndicator(
                          strokeWidth: 2.0, backgroundColor: Colors.red),
                    ),
                  );
                } else {
                  //是最后一页，显示我是有底线的
                  return new Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: new Text(
                      '我是有底线的!!!',
                      style: TextStyle(color: Colors.blue),
                    ),
                  );
                }
              } else {
                return ListTile(title: new Text('${_items[index]}'));
              }
            },
            //分割线构造器
            separatorBuilder: (context, index) {
              return new Divider(
                color: Colors.blue,
              );
            },
            //_items.length + 1是为了给最后一行的加载loading留出位置
            itemCount: _items.length + 1),
      ),
    );
  }
}
