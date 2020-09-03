import 'package:flutter/material.dart';
import '../model/post.dart';
import 'PostShowPage.dart';

class SliverDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // title: Text('NINGHAO'),// 标题
            pinned: true, // 滚动是否固定到导航栏
            floating: true,
            expandedHeight: 178.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                '滚动显示标题'.toUpperCase(),
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              background: Image.network(
                'https://resources.ninghao.net/images/overkill.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverListDemo(),
            ),
          ),
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 32.0),
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              elevation: 14.0,
              shadowColor: Colors.grey.withOpacity(0.5),
              child: Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      posts[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 32.0,
                    left: 32.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          posts[index].title,
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        Text(
                          posts[index].author,
                          style: TextStyle(fontSize: 13.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  // 添加一个点击水波纹效果
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent, // 设置透明度为透明效果
                      // 设置水波纹
                      child: InkWell(
                        splashColor: Colors.white.withOpacity(0.3), // 设置水波纹颜色
                        highlightColor:
                            Colors.white.withOpacity(0.1), // 设置点击水波纹高亮颜色
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/PostShowPage',
                            arguments: {
                              'title': posts[index].title,
                              'author': posts[index].author,
                              'description': posts[index].description,
                              'imageUrl': posts[index].imageUrl,
                              'data': posts[index]
                            },
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        childCount: posts.length,
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            child: Image.network(
              posts[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
        childCount: posts.length,
      ),
    );
  }
}
