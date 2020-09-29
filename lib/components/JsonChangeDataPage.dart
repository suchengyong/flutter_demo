import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/ModelData.dart';
import 'package:http/http.dart' as http;

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
    final response =
        await http.get('https://resources.ninghao.net/demo/posts.json');
    // print('请求状态：${response.statusCode}');
    // print('请求数据：${response.body}');
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      List<ModelData> modeldata = responseBody['posts']
          .map<ModelData>((item) => ModelData.fromJson(item))
          .toList();
      return modeldata;
    } else {
      throw Exception('数据请求错误');
    }
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
            return LoadingData();
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

class LoadingData extends StatelessWidget {
  const LoadingData({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        decoration: ShapeDecoration(
          color: Color(0xffffffff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              strokeWidth: 2,
              valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
              ),
              child: Text(
                '数据加载中...',
                style: TextStyle(fontSize: 14.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
