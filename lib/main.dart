import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // 配置国际化
import 'package:flutter_demo/pulgs/Delegate.dart'; //iOS 输入框全选择 复制 粘贴等
import 'package:flutter_demo/pulgs/i18n.dart'; // easyrefresh插件中文化配置
import 'Routes/Index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      initialRoute: '/', //初始化路由
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
    );
  }
}
