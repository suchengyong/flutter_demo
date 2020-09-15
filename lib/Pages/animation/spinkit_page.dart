import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinkitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("一个很棒的等待动画库——Spinkit", style: TextStyle(fontSize: 16.0)),
      ),
      body: SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 32.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitRotatingCircle(color: Colors.red),
                SpinKitRotatingPlain(color: Colors.green),
                SpinKitChasingDots(color: Colors.orange),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitPumpingHeart(color: Colors.green),
                SpinKitPulse(color: Colors.red),
                SpinKitDoubleBounce(color: Colors.green),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitWave(color: Colors.green, type: SpinKitWaveType.start),
                SpinKitWave(color: Colors.red, type: SpinKitWaveType.center),
                SpinKitWave(color: Colors.green, type: SpinKitWaveType.end),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitThreeBounce(color: Colors.green),
                SpinKitWanderingCubes(color: Colors.red),
                SpinKitWanderingCubes(
                    color: Colors.orange, shape: BoxShape.circle),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitCircle(color: Colors.green),
                SpinKitFadingFour(color: Colors.red),
                SpinKitFadingFour(
                    color: Colors.green, shape: BoxShape.rectangle),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitFadingCube(color: Colors.green),
                SpinKitCubeGrid(size: 51.0, color: Colors.red),
                SpinKitFoldingCube(color: Colors.green),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitRing(color: Colors.green),
                SpinKitDualRing(color: Colors.green),
                SpinKitRipple(color: Colors.green),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitFadingGrid(color: Colors.green),
                SpinKitFadingGrid(color: Colors.red, shape: BoxShape.rectangle),
                SpinKitHourGlass(color: Colors.green),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitSpinningCircle(color: Colors.green),
                SpinKitSpinningCircle(
                    color: Colors.red, shape: BoxShape.rectangle),
                SpinKitFadingCircle(color: Colors.green),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitPouringHourglass(color: Colors.green),
              ],
            ),
            const SizedBox(height: 64.0),
          ],
        ),
      ),
    );
  }
}
