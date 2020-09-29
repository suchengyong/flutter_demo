import 'package:flutter/material.dart';

class CurveWaveCuttingPage extends StatelessWidget {
  const CurveWaveCuttingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('贝赛尔二次曲线裁切波浪形形状'),
        elevation: 1.0,
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: BottomClipper(),
            child: Container(
              height: 250,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}

// 裁切
class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 40);
    var firstStartPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30);
    // 绘制贝赛尔次曲线
    path.quadraticBezierTo(
      firstStartPoint.dx,
      firstStartPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );
    var secondStartPoint = Offset(size.width / 4 * 3, size.height - 90);
    var secondEndPoint = Offset(size.width, size.height - 50);
    // 绘制贝赛尔次曲线
    path.quadraticBezierTo(
      secondStartPoint.dx,
      secondStartPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );
    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
