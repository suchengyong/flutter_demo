import 'package:flutter/material.dart';

// 头部选项卡 第一种实现方式
class TopBarsController extends StatefulWidget {
  TopBarsController({Key key}) : super(key: key);

  @override
  _TopBarsControllerState createState() => _TopBarsControllerState();
}

class _TopBarsControllerState extends State<TopBarsController>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void dispose() {
    //组件销毁的生命周期函数
    _tabController.dispose();
    super.dispose();
    _tabController.dispose(); //销毁掉
  }

  @override
  void initState() {
    //组件初始化生命周期
    super.initState();
    _tabController = new TabController(
        length: 3, //导航个数
        vsync: this);
    //监听Tab的改变
    _tabController.addListener(() {
      print('打印执行');
      print(_tabController.index); //打印它选中那个
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('顶部导航'),
          bottom: TabBar(
            indicatorColor: Colors.red, //指示器颜色
            labelColor: Colors.red, //选中文字颜色
            unselectedLabelColor: Colors.white, //未选中的颜色
            indicatorSize: TabBarIndicatorSize.label, //指示器大小和文字一样
            tabs: <Widget>[
              Tab(text: '推荐1'),
              Tab(text: '推荐2'),
              Tab(text: '推荐3')
            ],
            controller: this._tabController,
          )),
      body: TabBarView(controller: this._tabController, children: <Widget>[
        Center(child: Text('推荐1 内容。。。')),
        Center(child: Text('推荐2 内容。。。')),
        Center(child: Text('推荐3 内容。。。'))
      ]),
    );
  }
}

// 第二种实现方式
class TopBarsDemo extends StatelessWidget {
  const TopBarsDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //配置头部导航条
      length: 3, //导航个数
      child: Scaffold(
        appBar: AppBar(
          title: Text('顶部导航标题'),
          bottom: TabBar(
            //配置顶部导航栏
            indicatorColor: Colors.red,
            labelColor: Colors.white,
            tabs: <Widget>[Tab(text: '热们'), Tab(text: '推荐'), Tab(text: '视频')],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            //里面的在里不一定是ListView还可以是其他组件，但是个数要和tabs里面的Tab个数一样
            ListView(
              children: <Widget>[
                ListTile(title: Text("热门tab内容1")),
                ListTile(title: Text("热门tab内容2"))
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(title: Text("推荐tab内容1")),
                ListTile(title: Text("推荐tab内容2"))
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(title: Text("视频tab内容1")),
                ListTile(title: Text("视频tab内容2"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
