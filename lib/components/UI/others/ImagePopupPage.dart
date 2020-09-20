import 'package:flutter/material.dart';
import '../data/assets.dart';
import '../widgets/network_image.dart';

class ImagePopupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片弹出'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Text("点击图像以查看预览"),
          const SizedBox(height: 10.0),
          GestureDetector(
            onTap: () => _showImageDialog(context, mountEverest),
            child: Container(
              height: 200,
              child: PNetworkImage(
                mountEverest,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          GestureDetector(
            onTap: () => _showImageDialog(context, devDamodar),
            child: Container(
              height: 200,
              child: PNetworkImage(
                devDamodar,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          GestureDetector(
            onTap: () => _showImageDialog(context, avatars[1]),
            child: Container(
              height: 200,
              child: PNetworkImage(
                avatars[1],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showImageDialog(BuildContext context, String image) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                width: double.infinity,
                child: PNetworkImage(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 10.0),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.share),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
