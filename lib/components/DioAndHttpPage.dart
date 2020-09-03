import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

//使用dio
import 'package:dio/dio.dart';

class DioAndHttpPage extends StatefulWidget {
  DioAndHttpPage({Key key}) : super(key: key);

  @override
  _DioAndHttpPageState createState() => _DioAndHttpPageState();
}

class _DioAndHttpPageState extends State<DioAndHttpPage> {
  @override
  void initState() {
    //初始化生命周期，初始化调用
    super.initState();
    // this._getRequstData();
    // this._getDioRequsetData();
  }

  //dio get请求数据
  _getDioRequsetData() async {
    var url = 'https://news-at.zhihu.com/api/3/stories/latest';
    Response response = await Dio().get(url);
    print(response);
    _toastDialog('请求成功');
  }

  //dio post请求数据
  _postDioRequsetData() async {
    var url = 'https://news-at.zhihu.com/api/3/stories/latest';
    Map params = {'name': 'zhangsan', 'age': 20, 'sex': '男', 'love': '打球'};
    //Response response = await Dio().post(url, data: params);
    _toastDialog('提交请求失败');
  }

  //http get请求数据
  _getRequstData() async {
    var url = 'https://news-at.zhihu.com/api/3/stories/latest';
    var reslut = await http.get(url);
    if (reslut.statusCode == 200) {
      //请求成功状态
      var response = json.decode(reslut.body); //将返回数据是字符串形式转换为Json对象
      print(response);
      _toastDialog('请求成功');
    } else {
      //失败状态
      print('请求错误：${reslut.statusCode}');
    }
  }

  //http post请求数据
  _postRequstData() async {
    var url = 'https://news-at.zhihu.com/api/3/stories/latest';
    var params = {'name': 'zhangsan', 'age': '20', 'sex': '男', 'love': '打球'};
    var reslut = await http.post(url, body: params);
    if (reslut.statusCode == 200) {
      //请求成功状态
      var response = json.decode(reslut.body); //将返回数据是字符串形式转换为Json对象
      print(response);
      _toastDialog('提交请求成功');
    } else {
      //失败状态
      print('请求错误：${reslut.statusCode}');
      _toastDialog('提交请求失败');
    }
  }

  //toast弹出提示框
  _toastDialog(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('网络请求数据标题')),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text('get请求数据'),
                onPressed: () {
                  this._getRequstData();
                }),
            RaisedButton(
                child: Text('post请求数据'),
                onPressed: () {
                  this._postRequstData();
                }),
            RaisedButton(
                child: Text('dio get请求数据'),
                onPressed: () {
                  this._getDioRequsetData();
                }),
            RaisedButton(
                child: Text('dio post请求数据'),
                onPressed: () {
                  this._postDioRequsetData();
                }),
          ],
        ),
      ),
    );
  }
}
