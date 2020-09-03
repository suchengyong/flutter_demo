import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  const StackDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('层叠组件-定位组件'),
      ),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            SizedBox(
              width: 200.0,
              height: 300.0,
              child: Container(
                alignment: Alignment(0.0, -0.9),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(3, 54, 255, 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            SizedBox(
              width: 100.0,
              height: 100.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(3, 54, 255, 1.0),
                  shape: BoxShape.circle,
                  gradient: RadialGradient(colors: [
                    Color.fromRGBO(7, 102, 255, 1.0),
                    Color.fromRGBO(3, 54, 255, 1.0),
                  ]),
                ),
                child:
                    Icon(Icons.brightness_2, color: Colors.white, size: 32.0),
              ),
            ),
            Positioned(
              right: 20.0,
              top: 20.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0),
            ),
            Positioned(
              right: 40.0,
              top: 60.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 18.0),
            ),
            Positioned(
              right: 20.0,
              top: 120.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 20.0),
            ),
            Positioned(
              right: 70.0,
              top: 180.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0),
            ),
            Positioned(
              right: 30.0,
              top: 230.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 18.0),
            ),
            Positioned(
              right: 90.0,
              bottom: 20.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0),
            ),
            Positioned(
              right: 4.0,
              bottom: -4.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
