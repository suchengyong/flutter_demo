import 'dart:async';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  CustomDialog({this.title = '', this.content = ''});
  //使用定时器 关闭弹出框 ,使用定时器自动关闭
  _showTimer(context) {
    var timerFlage;
    timerFlage = Timer.periodic(Duration(milliseconds: 3000), (t) {
      Navigator.pop(context); //关闭弹出框
      t.cancel(); //取消定时器
    });
  }

  @override
  Widget build(BuildContext context) {
    //_showTimer(context);
    return Material(
      type: MaterialType.transparency, //配置透明度
      child: Center(
        child: Container(
          width: 300,
          height: 200,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        //自定义一个点击图标，InkWell没有任何样式，只是提供一个点击事件作用
                        child: Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xFF222222), width: 1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close,
                            color: Color(0xFF222222),
                            size: 18,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context); //关闭弹出框
                        },
                      ),
                    )
                  ],
                ),
              ),
              Divider(height: 1, color: Colors.grey),
              Container(
                alignment: Alignment.center,
                width: double.infinity, //宽度等于外部容器宽度
                child: Text(
                  '${this.content}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
