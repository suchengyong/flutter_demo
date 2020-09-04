import 'package:flutter/material.dart';
import '../Pages/HomePage.dart';
import '../Pages/ComponentsPage.dart';
import '../Pages/StatusPage.dart';
import '../Pages/AnimationPage.dart';

class TabBarCenterButton extends StatefulWidget {
  final index;
  TabBarCenterButton({Key key, this.index = 0}) : super(key: key);

  @override
  _TabBarCenterButtonState createState() =>
      _TabBarCenterButtonState(this.index);
}

class _TabBarCenterButtonState extends State<TabBarCenterButton> {
  int _currentIndex = 0;
  _TabBarCenterButtonState(index) {
    this._currentIndex = index;
  }
  List _pageList = [
    HomePage(),
    ComponentsPage(),
    StatusPage(),
    AnimationPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      //全屏浮动按钮
      floatingActionButton: Container(
        width: 70.0,
        height: 70.0,
        padding: EdgeInsets.all(6),
        margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),
        child: FloatingActionButton(
            child: Icon(Icons.add, color: Colors.white, size: 40),
            backgroundColor:
                this._currentIndex == 1 ? Colors.red : Colors.yellow,
            onPressed: () {
              print('浮动按钮');
              this.setState(() {
                this._currentIndex = 1;
              });
            }),
      ),
      //浮动按钮显示位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: this._pageList[this._currentIndex], //body部分
      bottomNavigationBar: BottomNavigationBar(
        //底部导航栏
        currentIndex: this._currentIndex, //选中那个
        iconSize: 36.0, //图标大小
        fixedColor: Colors.red, //选中的颜色
        type: BottomNavigationBarType.fixed, //pz底部TabBarCenterButton可以有多个按钮
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), title: Text('组件')),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('状态')),
          //BottomNavigationBarItem(icon: Icon(Icons.info), title: Text('我的'))
        ],
      ),
    ));
  }
}
