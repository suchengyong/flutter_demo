import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // 配置国际化
import 'package:flutter_demo/pulgs/Delegate.dart'; //iOS 输入框全选择 复制 粘贴等
import 'package:flutter_demo/pulgs/i18n.dart'; // easyrefresh插件中文化配置
import 'Routes/Index.dart';
import 'package:flutter_jpush/flutter_jpush.dart'; // 极光推送

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _initJPush();
  }

// 极光推送开始
  void _initJPush() async {
    await FlutterJPush.startup();
    print("初始化jpush成功");

    // 获取 registrationID
    var registrationID = await FlutterJPush.getRegistrationID();
    print(registrationID);

    // 注册接收和打开 Notification()
    _initNotification();
  }

  void _initNotification() async {
    FlutterJPush.addReceiveNotificationListener(
        (JPushNotification notification) {
      print("收到推送提醒: $notification");
    });

    FlutterJPush.addReceiveOpenNotificationListener(
        (JPushNotification notification) {
      print("打开了推送提醒: $notification");
    });
  }

// 极光推送结束
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      locale: Locale('en', 'CN'), // app 使用的语言
      debugShowCheckedModeBanner: false, //去掉dug显示
      title: 'flutter标题',
      theme: ThemeData(
        //主题定义
        primaryColor: Colors.pink, // 显示颜色
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5), // 按下时高亮颜色
        splashColor: Colors.white70, // 水波纹的颜色
        accentColor: Color.fromRGBO(3, 54, 255, 1.0), // 设置一种颜色
      ),
      initialRoute: '/SplashScreenPage', //初始化路由 先进入闪屏页面然后跳转到主页
      onGenerateRoute: onGenerateRoute,
      //中文汉化配置
      localizationsDelegates: [
        S.delegate, // 配置easyrefresh插件中文化配置
        GlobalCupertinoLocalizations.delegate,
        // 提供Material本地化组件
        GlobalMaterialLocalizations.delegate,
        // 定义组件文字的方向
        GlobalWidgetsLocalizations.delegate,
        //使用iOS风格弹出框 时需要添加 下面这个CupertinoAlertDialog
        //const FallbackCupertinoLocalisationsDelegate(),
        // 输入框长按复制粘贴
        CupertinoLocalizationsDelegate(),
      ],
      supportedLocales: [
        //Locale('en', 'US'),
        Locale('zh', 'CN'),
      ],
      // bot_toast 提示框配置
      navigatorObservers: [BotToastNavigatorObserver()],
    );
  }
}
