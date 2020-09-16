import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class LoadImagePage extends StatefulWidget {
  @override
  _LoadImageDemoState createState() => _LoadImageDemoState();
}

class _LoadImageDemoState extends State<LoadImagePage> {
  List<Asset> images = List<Asset>();
  String _error;

  Future<void> loadAssets() async {
    setState(() {
      images = List<Asset>();
    });
    List resultList;
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
      );
    } on PlatformException catch (e) {
      _error = e.message;
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      if (_error == null) _error = 'No Error Dectected';
    });
  }

  Widget builtImage(Asset asset) {
    if (asset != null) {
      return AssetThumb(
        asset: asset,
        width: 200,
        height: 100,
        // 加载图片动画
        spinner: Center(
          child: SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
    return Container(color: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('从本地相册选取多张图片'),
      ),
      body: ListView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
            return builtImage(images[index]);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: loadAssets,
        child: Icon(Icons.image),
      ),
    );
  }
}
