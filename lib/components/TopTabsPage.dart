import 'package:flutter/material.dart';

class TopTabsPage extends StatefulWidget {
  TopTabsPage({Key key}) : super(key: key);

  @override
  _TopTabsPageState createState() => _TopTabsPageState();
}

class _TopTabsPageState extends State<TopTabsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 14,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: TabBar(
                      //配置顶部导航栏
                      indicatorColor: Colors.black, //指示器颜色
                      labelColor: Colors.black, //选中文字颜色
                      unselectedLabelColor: Colors.white, //未选中的颜色
                      indicatorSize: TabBarIndicatorSize.label, //指示器大小和文字一样
                      isScrollable: true,
                      tabs: <Widget>[
                        Tab(text: '关于'),
                        Tab(text: '热榜'),
                        Tab(text: '推荐'),
                        Tab(text: '视频'),
                        Tab(text: '小视频'),
                        Tab(text: '直播'),
                        Tab(text: '影视'),
                        Tab(text: '教育'),
                        Tab(text: '音乐'),
                        Tab(text: '搞笑'),
                        Tab(text: '科技'),
                        Tab(text: '在家上课'),
                        Tab(text: '国防'),
                        Tab(text: '图片')
                      ]),
                )
              ]),
        ),
        body: TabBarView(
          children: <Widget>[
            //里面的在里不一定是ListView还可以是其他组件，但是个数要和tabs里面的Tab个数一样
            ListView(
              children: <Widget>[
                ListTile(
                  title: Center(
                    child: Text("关于tab内容1"),
                  ),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Center(
                    child: Text("热榜tab内容1"),
                  ),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Center(
                    child: Text("推荐tab内容1"),
                  ),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Center(
                    child: Text("视频tab内容1"),
                  ),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Center(
                    child: Text("小视频tab内容1"),
                  ),
                )
              ],
            ),
            ListView(children: <Widget>[
              ListTile(
                title: Center(
                  child: Text("直播tab内容1"),
                ),
              )
            ]),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Center(
                    child: Text("影视tab内容1"),
                  ),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Center(
                    child: Text("教育tab内容1"),
                  ),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Center(
                    child: Text("音乐tab内容1"),
                  ),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Center(
                    child: Text("搞笑tab内容1"),
                  ),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Center(
                    child: Text("科技tab内容1"),
                  ),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Center(
                    child: Text("在家上课tab内容1"),
                  ),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Center(
                    child: Text("国防tab内容1"),
                  ),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Center(
                    child: Text("图片tab内容1"),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
