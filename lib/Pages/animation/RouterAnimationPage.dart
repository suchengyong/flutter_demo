import 'package:flutter/material.dart';
import 'package:flutter_demo/Routes/CustomRoute.dart';

class RouterAnimationPage extends StatefulWidget {
  RouterAnimationPage({Key key}) : super(key: key);

  @override
  _RouterAnimationPageState createState() => _RouterAnimationPageState();
}

class _RouterAnimationPageState extends State<RouterAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由动画'),
      ),
      body: ListView(
        children: [
          RaisedButton(
            child: Text(
              '淡出淡入动画效果',
              textAlign: TextAlign.center,
            ),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              // 系统自带跳转动画
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => FirstPage(),
              //   ),
              // );
              // 使用自定义动画路由
              Navigator.of(context).push(
                CustomRoute(
                  page: FirstPage(),
                  animationType: 'fadeTransition',
                  animationTime: 1000,
                ),
              );
            },
          ),
          RaisedButton(
            child: Text(
              '旋转加缩放动画效果',
              textAlign: TextAlign.center,
            ),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              // 系统自带跳转动画
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => FirstPage(),
              //   ),
              // );
              // 使用自定义动画路由
              Navigator.of(context).push(
                CustomRoute(
                  page: FirstPage(),
                  animationType: 'rotationScale',
                  animationTime: 1000,
                ),
              );
            },
          ),
          RaisedButton(
            child: Text(
              '旋转加缩放加透明动画效果',
              textAlign: TextAlign.center,
            ),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              // 使用自定义动画路由
              Navigator.of(context).push(
                CustomRoute(
                  page: FirstPage(),
                  animationType: 'rotationScaleOpacity',
                  animationTime: 1000,
                ),
              );
            },
          ),
          RaisedButton(
            child: Text(
              '放大缩小动画效果',
              textAlign: TextAlign.center,
            ),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              // 使用自定义动画路由
              Navigator.of(context).push(
                CustomRoute(
                  page: FirstPage(),
                  animationType: 'scaleRouter',
                  animationTime: 1000,
                ),
              );
            },
          ),
          RaisedButton(
            child: Text(
              '右->左动画效果',
              textAlign: TextAlign.center,
            ),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              // 使用自定义动画路由
              Navigator.of(context).push(
                CustomRoute(
                  page: FirstPage(),
                  animationType: 'rightLeft',
                  animationTime: 500,
                ),
              );
            },
          ),
          RaisedButton(
            child: Text(
              '左->右动画效果',
              textAlign: TextAlign.center,
            ),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              // 使用自定义动画路由
              Navigator.of(context).push(
                CustomRoute(
                  page: FirstPage(),
                  animationType: 'Leftright',
                  animationTime: 500,
                ),
              );
            },
          ),
          RaisedButton(
            child: Text(
              '下->上动画效果',
              textAlign: TextAlign.center,
            ),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              // 使用自定义动画路由
              Navigator.of(context).push(
                CustomRoute(
                  page: FirstPage(),
                  animationType: 'downup',
                  animationTime: 800,
                ),
              );
            },
          ),
          RaisedButton(
            child: Text(
              '上->下动画效果',
              textAlign: TextAlign.center,
            ),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              // 使用自定义动画路由
              Navigator.of(context).push(
                CustomRoute(
                  page: FirstPage(),
                  animationType: 'updown',
                  animationTime: 800,
                ),
              );
            },
          ),
          RaisedButton(
            child: Text(
              '没有动画效果',
              textAlign: TextAlign.center,
            ),
            color: Theme.of(context).accentColor, //使用主题颜色
            textTheme: ButtonTextTheme.primary, //
            onPressed: () {
              // 使用自定义动画路由
              Navigator.of(context).push(
                CustomRoute(
                  page: FirstPage(),
                  animationTime: 0,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('路由动画第一个页面'),
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 66.0,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('路由动画第二个页面'),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
