import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidingUpPanelPage extends StatefulWidget {
  SlidingUpPanelPage({Key key}) : super(key: key);

  @override
  _SlidingUpPanelPageState createState() => _SlidingUpPanelPageState();
}

class _SlidingUpPanelPageState extends State<SlidingUpPanelPage> {
  bool showCollapsed = false; //是否显示折叠时的内容
  double maxHeight = 500; //最大展开高度
  double minHeight = 60; //最小收缩高度
  bool showBorder = false; //是否显示边框
  bool borderRadius = false; //启用圆角
  bool backdropEnabled = false; //启用背景半透明化
  bool parallaxEnabled = false; //开启视差滚动
  double parallaxOffset = 0.1; //时差滚动阀值 0.0-1.0
  bool slideDirectionReverse = false; //拖动方向
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("可定制的上下滑出抽屉."),
      ),
      body: SlidingUpPanel(
          collapsed: showCollapsed
              ? Center(
                  child: Text("向上滑动以打开面板"),
                )
              : null,
          panel: Center(
            child: Text("我是面板内容"),
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("是否显示折叠时的组件"),
                    new Switch(
                      value: this.showCollapsed,
                      activeColor: Colors.blue,
                      onChanged: (bool val) {
                        this.setState(() {
                          this.showCollapsed = !this.showCollapsed;
                        });
                      },
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("最大展开高度:" + maxHeight.toInt().toString()),
                    new Slider(
                      value: this.maxHeight,
                      max: MediaQuery.of(context).size.height - 44,
                      min: 20.0,
                      activeColor: Colors.blue,
                      onChanged: (double val) {
                        this.setState(() {
                          this.maxHeight = val;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("是否显示边框border"),
                    new Switch(
                      value: this.showBorder,
                      activeColor: Colors.blue,
                      onChanged: (bool val) {
                        this.setState(() {
                          this.showBorder = !this.showBorder;
                        });
                      },
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("是否启用圆角"),
                    new Switch(
                      value: this.borderRadius,
                      activeColor: Colors.blue,
                      onChanged: (bool val) {
                        this.setState(() {
                          this.borderRadius = !this.borderRadius;
                        });
                      },
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("是否背景半透明化"),
                    new Switch(
                      value: this.backdropEnabled,
                      activeColor: Colors.blue,
                      onChanged: (bool val) {
                        this.setState(() {
                          this.backdropEnabled = !this.backdropEnabled;
                        });
                      },
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("开启视差滚动"),
                    new Switch(
                      value: this.parallaxEnabled,
                      activeColor: Colors.blue,
                      onChanged: (bool val) {
                        this.setState(() {
                          this.parallaxEnabled = !this.parallaxEnabled;
                        });
                      },
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("视差滚动阀值:" + parallaxOffset.toStringAsFixed(2)),
                    new Slider(
                      value: this.parallaxOffset,
                      max: 1.0,
                      min: 0.0,
                      activeColor: Colors.blue,
                      onChanged: (double val) {
                        this.setState(() {
                          this.parallaxOffset = val;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("从上往下"),
                    new Switch(
                      value: this.slideDirectionReverse,
                      activeColor: Colors.blue,
                      onChanged: (bool val) {
                        this.setState(() {
                          this.slideDirectionReverse =
                              !this.slideDirectionReverse;
                        });
                      },
                    )
                  ],
                ),
                Center(
                  child: FlatButton(
                    child: Text("仿头条小视频评论面板"),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ToutiaoDemo();
                      }));
                    },
                  ),
                )
              ],
            ),
          ),
          maxHeight: maxHeight,
          minHeight: minHeight,
          border: showBorder
              ? Border(
                  top: BorderSide(
                  color: Colors.blue,
                ))
              : null,
          borderRadius: borderRadius
              ? BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                )
              : null,
          backdropEnabled: backdropEnabled,
          parallaxEnabled: parallaxEnabled,
          parallaxOffset: parallaxOffset,
          slideDirection:
              slideDirectionReverse ? SlideDirection.DOWN : SlideDirection.UP),
    );
  }
}

// 头条弹出框
class ToutiaoDemo extends StatefulWidget {
  ToutiaoDemo({Key key}) : super(key: key);

  @override
  _ToutiaoDemoState createState() => _ToutiaoDemoState();
}

class _ToutiaoDemoState extends State<ToutiaoDemo> {
  PanelController panel = new PanelController();
  double offsetDistance = 0.0;
  double offsetY = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SlidingUpPanel(
        controller: panel,
        minHeight: 0,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        body: GestureDetector(
          child: new ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: new Image.asset(
              "assets/images/2.jpg",
              fit: BoxFit.fill,
            ),
          ),
          onTap: () {
            panel.close();
          },
          onVerticalDragDown: (details) {
            // print(details.globalPosition.dy);
            offsetDistance = details.globalPosition.dy;
          },
          onVerticalDragUpdate: (details) {
            offsetY = details.globalPosition.dy - offsetDistance;
            if (offsetY > 0) {
              print("向下" + offsetY.toString());
            } else {
              print("向上" + offsetY.toString());
              double position = offsetY.abs() / 300;
              position = position > 1 ? 1 : position;
              //panel.setPanelPosition(position);
              if (position > 0.4) {
                panel.open();
              }
            }
          },
        ),
        panel: Container(
          child: Center(
            child: Text("评论区",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none)),
          ),
        ),
      ),
    );
  }
}
