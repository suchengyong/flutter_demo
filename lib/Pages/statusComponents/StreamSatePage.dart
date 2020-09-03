import 'package:flutter/material.dart';
import 'dart:async';

class StreamSatePage extends StatefulWidget {
  StreamSatePage({Key key}) : super(key: key);

  @override
  _StreamSatePageState createState() => _StreamSatePageState();
}

class _StreamSatePageState extends State<StreamSatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('stream--状态管理'),
        elevation: 0.0,
      ),
      body: Center(child: StreamDemoHome()),
    );
  }
}

// 组件
class StreamDemoHome extends StatefulWidget {
  StreamDemoHome({Key key}) : super(key: key);

  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamDemoSubscription;
  StreamController<String> _streamDemo;
  StreamSink _sinkDemo; // 添加数据

  @override
  void initState() {
    super.initState();
    // 创建string 初始化数据
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    // 监听stream
    // _streamDemoSubscription = _streamDemo.listen(onData, onError: onError, onDone: onDone);

    // 使用 StreamController
    // _streamDemo = StreamController<String>();
    // 使用 StreamController 监听
    // _streamDemoSubscription = _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);
    //  StreamController.broadcast可以添加多个订阅
    _streamDemo = StreamController.broadcast();
    // 监听多个订阅数据
    _streamDemoSubscription =
        _streamDemo.stream.listen(onDataTwo, onError: onError, onDone: onDone);
    // streamsink 可以用来添加数据
    _sinkDemo = _streamDemo.sink;
  }

  @override
  void dispose() {
    super.dispose();
    // 组件卸载的时候移除关闭stream
    _streamDemo.close();
  }

  // 监听获取数据
  void onData(String data) {
    //throw '抛出一个异常';
    print('onData: ' + data);
  }

  // 监听错误
  void onError(error) {
    print('Error:' + error);
  }

  // 监听数据请求完成
  void onDone() {
    print('done--完成请求');
  }

  // 监听多个数据请求完成
  void onDataTwo(String data) {
    print('onDataTwo: ' + data);
  }

  // 将返回的数据放到stream中
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    return 'hello word!';
  }

  //按钮 暂停订阅
  void _pauseStream() {
    print('暂停订阅 pause subscription');
    _streamDemoSubscription.pause();
  }

  //按钮 恢复订阅
  void _resumeStream() {
    print('恢复订阅 resume subscription');
    _streamDemoSubscription.resume();
  }

  //按钮 取消订阅
  void _cancelStream() {
    print('取消订阅 cancel subscription');
    _streamDemoSubscription.cancel();
  }

  // 请求数据
  Future<String> fetchAddData() async {
    await Future.delayed(Duration(seconds: 5));
    return 'stream-添加数据!';
  }

  // 给stream上添加数据
  void _addDataToStream() async {
    print('添加数据');
    String data = await fetchAddData();
    //_streamDemo.add(data);
    // streamsink 也可以添加数据
    _sinkDemo.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder(
            stream: _streamDemo.stream,
            initialData: '数据加载中...',
            builder: (context, snapshot) {
              return Text('${snapshot.data}');
            },
          ),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 5,
            children: <Widget>[
              RaisedButton(
                child: Text('暂停订阅'),
                onPressed: () {
                  _pauseStream();
                },
              ),
              RaisedButton(
                child: Text('恢复订阅'),
                onPressed: () {
                  _resumeStream();
                },
              ),
              RaisedButton(
                child: Text('取消订阅'),
                onPressed: () {
                  _cancelStream();
                },
              ),
              RaisedButton(
                child: Text('添加数据'),
                onPressed: () {
                  _addDataToStream();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
