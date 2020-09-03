import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimePage extends StatefulWidget {
  CountdownTimePage({Key key}) : super(key: key);

  @override
  _CountDownTimeState createState() => _CountDownTimeState();
}

class _CountDownTimeState extends State<CountdownTimePage> {
  Timer _timer;

  //倒计时数值
  var countdownTime = 0;

  //倒计时方法
  startCountdown() {
    print('开始倒计时');
    //倒计时时间
    countdownTime = 60;
    final call = (timer) {
      if (countdownTime < 1) {
        _timer.cancel();
        countdownTime = 0;
        _timer = null;
      } else {
        setState(() {
          countdownTime -= 1;
        });
      }
    };
    if (_timer == null) {
      _timer = Timer.periodic(Duration(seconds: 1), call);
    }
  }

  String handleCodeAutoSizeText() {
    if (countdownTime > 0) {
      return "${countdownTime}s后重新获取";
    } else
      return "获取验证码";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('倒计时'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              handleCodeAutoSizeText(),
              style: TextStyle(fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.all(80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        if (countdownTime == 0) {
                          startCountdown();
                        }
                      },
                      child: Text("开始"),
                      color: Colors.blue,
                    ),
                  ),
                  Expanded(
                    child: Text(""),
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          countdownTime = 0;
                        });
                      },
                      child: Text("结束"),
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }
}
