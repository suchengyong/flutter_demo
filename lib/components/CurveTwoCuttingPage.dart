import 'package:flutter/material.dart';

class CurveTwoCuttingPage extends StatelessWidget {
  const CurveTwoCuttingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('贝赛尔二次曲线裁切各种形状'),
        elevation: 1.0,
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: BottomClipper(),
            child: Container(
              height: 250,
              color: Colors.blue,
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
    path.lineTo(0, size.height - 60);
    var firstStartPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 60);
    // 绘制贝赛尔次曲线
    path.quadraticBezierTo(
      firstStartPoint.dx,
      firstStartPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );
    path.lineTo(size.width, size.height - 60);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
