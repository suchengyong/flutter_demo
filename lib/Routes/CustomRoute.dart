import 'package:flutter/material.dart';

// 自定义路由动画效果
class CustomRoute extends PageRouteBuilder {
  final Widget page;
  final animationType;
  int animationTime;
  CustomRoute({this.page, this.animationType, this.animationTime})
      : super(
          transitionDuration: Duration(milliseconds: animationTime),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation1,
            Animation<double> animation2,
          ) {
            return page;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation1,
            Animation<double> animation2,
            Widget child,
          ) {
            if (animationType == 'fadeTransition') {
              // 淡出淡入 动画
              return FadeTransition(
                opacity: Tween(
                  begin: 0.0,
                  end: 1.0,
                ).animate(
                  CurvedAnimation(
                    parent: animation1,
                    curve: Curves.fastOutSlowIn, // 设置动画曲线 快出慢进
                  ),
                ),
                child: child,
              );
            } else if (animationType == 'rotationScale') {
              // 旋转加缩放
              return RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: animation1,
                  curve: Curves.fastOutSlowIn, // 设置动画曲线 快出慢进
                )),
                child: ScaleTransition(
                  //缩放动画
                  scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animation1,
                    curve: Curves.fastOutSlowIn, // 设置动画曲线 快出慢进
                  )),
                  child: child,
                ),
              );
            } else if (animationType == 'rotationScaleOpacity') {
              // 缩放+透明+旋转路由动画
              return RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: animation1,
                  curve: Curves.fastOutSlowIn, // 设置动画曲线 快出慢进
                )),
                child: ScaleTransition(
                  //缩放动画
                  scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animation1,
                    curve: Curves.fastOutSlowIn, // 设置动画曲线 快出慢进
                  )),
                  child: FadeTransition(
                    // 透明度动画
                    opacity: Tween(begin: 0.5, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animation1,
                        curve: Curves.fastOutSlowIn,
                      ),
                    ),
                    child: child,
                  ),
                ),
              );
            } else if (animationType == 'scaleRouter') {
              //缩放路由动画
              return ScaleTransition(
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: animation1,
                  curve: Curves.fastOutSlowIn, // 设置动画曲线 快出慢进
                )),
                child: child,
              );
            } else if (animationType == 'rightLeft') {
              //右--->左
              return SlideTransition(
                child: child,
                position: Tween<Offset>(
                  begin: Offset(1.0, 0.0),
                  end: Offset(0.0, 0.0),
                ).animate(
                  CurvedAnimation(
                    parent: animation1,
                    curve: Curves.fastOutSlowIn, // 设置动画曲线 快出慢进
                  ),
                ),
              );
            } else if (animationType == 'Leftright') {
              //左--->右
              return SlideTransition(
                child: child,
                position: Tween<Offset>(
                  begin: Offset(-1.0, 0.0),
                  end: Offset(0.0, 0.0),
                ).animate(
                  CurvedAnimation(
                    parent: animation1,
                    curve: Curves.fastOutSlowIn, // 设置动画曲线 快出慢进
                  ),
                ),
              );
            } else if (animationType == 'downup') {
              //下--->上
              return SlideTransition(
                child: child,
                position: Tween<Offset>(
                  begin: Offset(0.0, -1.0),
                  end: Offset(0.0, 0.0),
                ).animate(
                  CurvedAnimation(
                    parent: animation1,
                    curve: Curves.fastOutSlowIn, // 设置动画曲线 快出慢进
                  ),
                ),
              );
            } else if (animationType == 'updown') {
              //上--->下
              return SlideTransition(
                child: child,
                position: Tween<Offset>(
                  begin: Offset(0.0, 1.0),
                  end: Offset(0.0, 0.0),
                ).animate(
                  CurvedAnimation(
                    parent: animation1,
                    curve: Curves.fastOutSlowIn, // 设置动画曲线 快出慢进
                  ),
                ),
              );
            } else {
              // 没有动画效果
              return child;
            }
          },
        );
}
