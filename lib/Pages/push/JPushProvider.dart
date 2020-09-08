import 'package:flutter/material.dart';
import 'package:flutter_jpush/flutter_jpush.dart'; // 极光推送

class JPushProvider with ChangeNotifier {
  JPushProvider() {
    _initJPush();
  }
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
}
