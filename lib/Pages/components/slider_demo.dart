import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sliderItemA = 0.0;
  double _sliderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliderDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Slider(
                  value: _sliderItemA,
                  onChanged: (value) {
                    setState(() {
                      _sliderItemA = value;
                    });
                  },
                  //  滑动结束
                  onChangeEnd: (val) {},
                  //  滑动开始
                  onChangeStart: (val) {},
                  activeColor: Theme.of(context).accentColor,
                  inactiveColor: Theme.of(context).accentColor.withOpacity(0.3),
                  min: 0.0,
                  max: 10.0,
                  divisions: 10,
                  label: '${_sliderItemA.toInt()}',
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Text('SliderValue: $_sliderItemA'),
            SizedBox(
              height: 30.0,
            ),
            SliderTheme(
              //滑块主题
              data: SliderTheme.of(context).copyWith(
                  // 实际进度颜色
                  activeTrackColor: Colors.yellowAccent,
                  // 未拖动颜色
                  inactiveTrackColor: Colors.red,
                  // 提示进度的气泡的背景色
                  valueIndicatorColor: Colors.blue,
                  // 气泡的文本颜色
                  // valueIndicatorTextStyle: TextStyle(color: Colors.white)
                  // 滑块中心的颜色
                  thumbColor: Colors.blueAccent,
                  // 滑块边缘的颜色
                  overlayColor: Colors.white,
                  // 分割线颜色
                  inactiveTickMarkColor: Colors.black),
              child: Slider(
                value: _sliderValue,
                min: 0.0,
                max: 100.0,
                label: '当前音量',
                // activeColor: Colors.green,
                // inactiveColor: Colors.redAccent,
                //  分块
                divisions: 100,
                onChanged: (double) {
                  setState(() {
                    _sliderValue = double.roundToDouble();
                  });
                },
                //  滑动结束
                onChangeEnd: (val) {},
                //  滑动开始
                onChangeStart: (val) {},
              ),
            ),
            Text('滑动值: $_sliderValue'),
          ],
        ),
      ),
    );
  }
}
