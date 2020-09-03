import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenutilPage extends StatelessWidget {
  const ScreenutilPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 适配手机不同端初始化
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('适配各种终端手机'),
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: ScreenUtil().setHeight(70),
              width: ScreenUtil().setWidth(400),
              // 简单的用法
              // height: 70.h,
              // width: 400.w,
              margin: EdgeInsets.only(top: 20),
              color: Colors.red,
              child: Text(
                '各个手机端适配用法展示效果',
                style: TextStyle(
                  color: Colors.white,
                  // 字体适配简单用法
                  //fontSize: 30.sp,
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: 200,
              margin: EdgeInsets.only(top: 20),
              color: Colors.green,
              child: Text(
                '不使用适配展示效果',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
