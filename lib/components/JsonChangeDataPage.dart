import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Dailog/Loading.dart';

class JsonChangeDataPage extends StatefulWidget {
  JsonChangeDataPage({Key key}) : super(key: key);

  @override
  _JsonChangeDataPageState createState() => _JsonChangeDataPageState();
}

class _JsonChangeDataPageState extends State<JsonChangeDataPage> {
  var postModel;
  @override
  void initState() {
    super.initState();
    // 请求数据
    //fetchPosts().then((value) => print(value));
    final post = {'title': '你好', 'money': 50000000, 'description': '数据描述'};
    // 转换数据为json
    var postJson = json.encode(post);
    //print(postJson);

    // 将json转换为字符串
    final postJsonConverted = json.decode(postJson);
    print(postJsonConverted['title']);
    // print(postJsonConverted['des']);
    // print(postJsonConverted is Map);
  }

  Future<List<ModelData>> fetchPosts(context) async {
    _customLoading(false);
    final response =
        await http.get('https://resources.ninghao.net/demo/posts.json');
    // print('请求状态：${response.statusCode}');
    // print('请求数据：${response.body}');
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      List<ModelData> modeldata = responseBody['posts']
          .map<ModelData>((item) => ModelData.fromJson(item))
          .toList();
      // 关闭加载动画
      _customLoading(true);
      return modeldata;
    } else {
      // 关闭加载动画
      Navigator.pop(context);
      throw Exception('数据请求错误');
    }
  }

  //自定义loading框
  _customLoading(falge) {
    showDialog(
      context: context,
      builder: (context) {
        return LoadingDialog(
          text: '加载中...',
          close: falge,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('请求数据转换为json'),
        elevation: 0.0, //阴影大小
      ),
      body: FutureBuilder(
        // 数据请求加载完成才渲染页面
        future: fetchPosts(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print('打印数据和状态=====');
          print('状态：${snapshot.connectionState}');
          print('数据：${snapshot.data}');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('数据加载中...'), //'数据加载中...'
            );
          }
          // 如果有数据
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data.map<Widget>((item) {
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.author),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item.imageUrl),
                  ),
                );
              }).toList(),
            );
          } else {
            return Center(
              child: Text('数据请求失败'),
            );
          }
        },
      ),
    );
  }
}

// 写一个构造类
class ModelData {
  final int id;
  final String title;
  final String author;
  final String description;
  final String imageUrl;

  ModelData(this.id, this.title, this.author, this.description, this.imageUrl);

  ModelData.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        author = json['author'],
        description = json['description'],
        imageUrl = json['imageUrl'];

  Map toJson() => {
        'title': title,
        'description': description,
        'imageUrl': imageUrl,
        'author': author,
        'id': id,
      };
}
