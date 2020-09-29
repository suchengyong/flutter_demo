import 'package:flutter/material.dart';
import 'dart:async';

// ignore: must_be_immutable
class LoadingDialog extends Dialog {
  String text;
  LoadingDialog({Key key, @required this.text}) : super(key: key);
  //使用定时器 关闭弹出框 ,使用定时器自动关闭
  _closeDialog(context) {
    Timer.periodic(Duration(milliseconds: 5000), (t) {
      t.cancel(); //取消定时器
      Navigator.pop(context); //关闭弹出框
    });
  }
  // 关闭弹出框

  @override
  Widget build(BuildContext context) {
    _closeDialog(context);
    return new Material(
      //创建透明层
      type: MaterialType.transparency, //透明类型
      child: new Center(
        //保证控件居中效果
        child: new SizedBox(
          width: 120.0,
          height: 120.0,
          child: new Container(
            decoration: ShapeDecoration(
              color: Color(0xffffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor),
                ),
                new Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: new Text(
                    text,
                    style: new TextStyle(fontSize: 14.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
