import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartPage extends StatefulWidget {
  RxDartPage({Key key}) : super(key: key);

  @override
  _RxDartPageState createState() => _RxDartPageState();
}

class _RxDartPageState extends State<RxDartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rxdart状态管理'),
        elevation: 0.0,
      ),
      body: RxDartDemoHome(),
    );
  }
}

// 组件
class RxDartDemoHome extends StatefulWidget {
  RxDartDemoHome({Key key}) : super(key: key);

  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _textFieldSubject;
  @override
  void initState() {
    super.initState();

    _textFieldSubject = PublishSubject<String>();

    _textFieldSubject
        .map((item) => 'item: $item')
        //.where((item) => item.length > 9)
        .listen((data) => print(data));

    // Observable<String> _observable =
    //     // Observable(Stream.fromIterable(['hello', '您好']));
    //     // Observable.fromFuture(Future.value('hello ~'));
    //     // Observable.fromIterable(['hello', '您好']);
    //     // Observable.just('hello ~');
    //     Observable.periodic(Duration(seconds: 3), (x) => x.toString());

    // _observable.listen(print);

    // PublishSubject<String> _subject = PublishSubject<String>();
    // BehaviorSubject<String> _subject = BehaviorSubject<String>();
    // ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 2);

    // _subject.add('hello');
    // _subject.add('hola');
    // _subject.add('hi');
    // _subject.listen((data) => print('listen 1: $data'));
    // _subject.listen((data) => print('listen 2: ${data.toUpperCase()}'));

    // _subject.close();
  }

  @override
  void dispose() {
    super.dispose();
    _textFieldSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        onChanged: (value) {
          _textFieldSubject.add('input: $value');
        },
        onSubmitted: (value) {
          _textFieldSubject.add('submit: $value');
        },
        decoration: InputDecoration(
          labelText: 'Title',
          filled: true,
        ),
      ),
    );
  }
}
