import 'package:flutter/material.dart';

/// 曲线背景 组件
class CurveBgWidget extends StatelessWidget {
  final Color color;
  const CurveBgWidget({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      color: color,
      child: ClipPath(
        // 路径裁切组件
        clipper: CurveClipper(),
        child: Container(
          height: 320,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xFFEA3D87), Color(0xFFFF7095)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
        ),
      ),
    );
  }
}

/// 曲线路径 组件
class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()..lineTo(0, 0)..lineTo(0, size.height - 60.0);
    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEdnPoint = Offset(size.width, size.height - 60.0);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEdnPoint.dx, firstEdnPoint.dy);

    path..lineTo(size.width, size.height - 60.0)..lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// 定义不规则容器 组件
class IrregularContainer extends StatelessWidget {
  final double width;
  final double height;
  final double circleRadius;
  final double borderRadius;
  final double circleTopOffset;
  final Color color;
  final Widget child;
  final EdgeInsetsGeometry padding;
  const IrregularContainer(
      {this.width,
      this.height,
      this.circleRadius,
      this.borderRadius,
      this.circleTopOffset,
      this.color,
      this.child,
      this.padding,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      //clipper: IrregularClipper(circleRadius, circleTopOffset, borderRadius),
      child: Container(
        padding: padding,
        color: color,
        height: height,
        width: width,
        child: child,
      ),
    );
  }
}

/// 不规则裁剪 组件
class IrregularClipper extends CustomClipper<Path> {
  // final double circleRadius;
  // final double borderRadius;
  // final double circleTopOffset;
  @override
  Path getClip(Size size) {
    var path = Path()..lineTo(0, 0)..lineTo(0, size.height - 60.0);
    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEdnPoint = Offset(size.width, size.height - 60.0);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEdnPoint.dx, firstEdnPoint.dy);

    path..lineTo(size.width, size.height - 60.0)..lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
