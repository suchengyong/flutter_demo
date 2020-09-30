import 'dart:math';

import 'package:flutter/material.dart';

class ChatBoxPainter extends StatelessWidget {
  const ChatBoxPainter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    double height = 50 * rpx;
    double width = 30 * rpx;
    return Scaffold(
      appBar: AppBar(
        title: Text('绘制一个三角形'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomPaint(
              painter: CanvasPainter(
                height: height,
                width: width,
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            // 旋转 角度
            Transform.rotate(
              angle: pi,
              child: CustomPaint(
                painter: CanvasPainter(
                  height: height,
                  width: width,
                  color: Colors.red,
                ),
              ),
            ),
            // 旋转 30角度
            Transform.rotate(
              angle: 30,
              child: CustomPaint(
                painter: CanvasPainter(
                  height: height,
                  width: width,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 绘制一个三角形
class CanvasPainter extends CustomPainter {
  CanvasPainter(
      {@required this.width, @required this.height, @required this.color});
  final double width;
  final double height;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path()
      ..moveTo(0, height / 2)
      ..lineTo(width, height)
      ..lineTo(width, 0)
      ..lineTo(0, height / 2);

    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color
      ..strokeWidth = 1;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CanvasPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CanvasPainter oldDelegate) => false;
}
