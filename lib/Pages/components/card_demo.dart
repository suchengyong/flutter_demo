import 'package:flutter_demo/model/post.dart';
import 'package:flutter/material.dart';

class CardDemo extends StatefulWidget {
  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CardDemo'),
        elevation: 0.0,
      ),
      body: ListViewAndCard(),
    );
  }
}

// 布局循环
class ListViewAndCard extends StatelessWidget {
  const ListViewAndCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: ListView(
        children: posts.map((post) {
          return Card(
            child: Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                    child: Image.network(
                      post.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(post.imageUrl),
                  ),
                  title: Text(post.title),
                  subtitle: Text(post.author),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    post.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text('Like'.toUpperCase()),
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: Text('Read'.toUpperCase()),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

// 卡片上面覆盖一个盲板内容
class StackAndCard extends StatelessWidget {
  const StackAndCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598335846045&di=20c074b6300887576a55e11e89e8079d&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2020-08-24%2F5f43275dde411.jpg",
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 10),
                color: Color.fromRGBO(0, 0, 0, 0.5),
                child: Text(
                  '七夕情人节，美女一堆相伴',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
