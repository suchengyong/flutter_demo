import 'dart:typed_data';
import 'dart:ui' as UI;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CanvasPage extends StatefulWidget {
  CanvasPage({Key key}) : super(key: key);

  @override
  _CanvasPageState createState() => _CanvasPageState();
}

// canvas基本实现原理使用方法
// class _CanvasPageState extends State<CanvasPage> {
//   ByteData byteData;
//   @override
//   void initState() {
//     super.initState();

//     UI.PictureRecorder pictureRecorder = UI.PictureRecorder();
//     Rect rect = Rect.fromPoints(Offset(0, 0), Offset(300, 300));

//     Canvas canvas = Canvas(pictureRecorder, rect);
//     canvas.drawColor(Colors.red, BlendMode.color);
//     UI.Picture picture = pictureRecorder.endRecording();

//     // 转化为图片
//     picture.toImage(300, 300).then((value) async {
//       byteData = await value.toByteData(format: UI.ImageByteFormat.png);
//       // 更新渲染页面
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (byteData == null) return Container();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('canvas的各种使用方式'),
//       ),
//       body: Container(
//         child: Image.memory(Uint8List.view(byteData.buffer)),
//       ),
//     );
//   }
// }
/// 自定义创建画布用法
class _CanvasPageState extends State<CanvasPage> {
  @override
  Widget build(BuildContext context) {
    // 创建canvas画布
    var paint = CustomPaint(
      size: Size(300, 300),
      painter: MyPainter(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('canvas的各种使用方式'),
      ),
      body: Container(
        child: paint,
      ),
    );
  }
}

// 具体绘画内容
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 开始画
    //1.clip Api 系列使用
    // 画一个距行
    // canvas.drawRect(
    //   Rect.fromPoints(
    //     Offset(0, 0),
    //     Offset(size.width, size.height),
    //   ),
    //   Paint()..color = Colors.red,
    // );
    // 距形
    //Rect rect = Rect.fromPoints(Offset(30, 30), Offset(100, 100));
    //canvas.clipRect(rect);// 剪切距形
    //传入一个距形
    //rect.intersect(Rect.fromPoints(
    //   Offset(80, 80),
    //   Offset(150, 150),
    // ));
    //canvas.clipRect(rect); // 剪切距形
    //绘制剪切完的距形
    // canvas.drawRect(
    //   Rect.fromPoints(
    //     Offset(30, 30),
    //     Offset(100, 100),
    //   ),
    //   Paint()..color = Colors.green,
    // );

    // 2.clipPath 使用
    // 基本画一条线
    // Paint paint = Paint()
    //   ..color = Colors.red
    //   ..strokeWidth = 3
    //   ..style = PaintingStyle.stroke;

    // Path path = Path();
    // path.moveTo(10, 10);
    // path.lineTo(50, 10);
    // path.close();
    // canvas.drawPath(path, paint);
    // 贝塞尔曲线 画法
    // Paint paint = Paint()
    //   ..color = Colors.red
    //   ..strokeWidth = 3
    //   ..style = PaintingStyle.stroke;

    // Path path = Path();
    // path.moveTo(100, 100);
    // // 二维 贝塞尔曲线
    // path.quadraticBezierTo(200, 0, 300, 100);
    // // 三维 贝塞尔曲线
    // path.cubicTo(200, 200, 300, 0, 400, 100);
    // canvas.drawPath(path, paint);

    // 贝塞尔曲线 画一个水波形状
    // Paint paint = Paint()
    //   ..color = Colors.green
    //   ..style = PaintingStyle.fill;

    // Path path = Path();
    // path.moveTo(0, 100);
    // // 三维 贝塞尔曲线
    // path.cubicTo(200, 200, 300, 0, 400, 100);
    // path.lineTo(500, 300);
    // path.lineTo(0, 300);
    // path.close();
    // //canvas.clipPath(path);
    // canvas.drawPath(path, paint);

    // 画圆
    //canvas.drawCircle(Offset(50, 50), 50, Paint()..color = Colors.red);
    // 画图片
    //canvas.drawImage(image, offset, paint)

    /// 3. save,saveLayer,restore, Api的使用
    Rect rect = Rect.fromPoints(Offset(130, 130), Offset(200, 200));
    canvas.drawRect(rect, Paint()..color = Colors.red);
    canvas.save();

    canvas.rotate(0.3);
    Rect rect1 = Rect.fromPoints(Offset(130, 130), Offset(200, 200));
    canvas.drawRect(rect1, Paint()..color = Colors.green);

    canvas.restore(); // 恢复原来的样式
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
