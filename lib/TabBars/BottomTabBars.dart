import 'package:flutter/material.dart';
import '../Pages/HomePage.dart';
import '../Pages/ComponentsPage.dart';
import '../Pages/StatusPage.dart';
import '../Pages/MyPage.dart';

class BottomTabBars extends StatefulWidget {
  final index;
  BottomTabBars({Key key, this.index = 0}) : super(key: key);

  @override
  _BottomTabBarsState createState() => _BottomTabBarsState(this.index);
}

class _BottomTabBarsState extends State<BottomTabBars> {
  int _currentIndex = 0;
  _BottomTabBarsState(index) {
    this._currentIndex = index;
  }
  List _pageList = [HomePage(), ComponentsPage(), StatusPage(), MyPage()];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: this._pageList[this._currentIndex], //body部分
        bottomNavigationBar: BottomNavigationBar(
          //底部导航栏
          currentIndex: this._currentIndex, //选中那个
          iconSize: 36.0, //图标大小
          fixedColor: Colors.red, //选中的颜色
          type: BottomNavigationBarType.fixed, //pz底部BottomTabBars可以有多个按钮
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
            BottomNavigationBarItem(icon: Icon(Icons.info), title: Text('我的'))
          ],
        ),
      ),
    );
  }
}
