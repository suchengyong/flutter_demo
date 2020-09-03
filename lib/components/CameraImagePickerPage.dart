import 'package:flutter/material.dart';

import 'CameraPage.dart';
import 'ImagePickerPage.dart';

class CameraImagePickerPage extends StatelessWidget {
  CameraImagePickerPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("相机和图片选择"),
      ),
      body: new Container(
        margin: EdgeInsets.all(10),
        child: new Wrap(
          spacing: 10,
          children: <Widget>[
            new GestureDetector(
              child: new Chip(label: new Text("照相机")),
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                  return CameraPage();
                }));
              },
            ),
            new GestureDetector(
              child: new Chip(label: new Text("选择图片")),
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                  return ImagePickerPage();
                }));
              },
            ),
            Text('说明，iOS模拟器 播放器无法正常工作，所以打开照相机和录像功能必须使用iOS真机测试')
          ],
        ),
      ),
    );
  }
}
