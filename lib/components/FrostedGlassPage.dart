import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlassPage extends StatefulWidget {
  FrostedGlassPage({Key key}) : super(key: key);

  @override
  _FrostedGlassPageState createState() => _FrostedGlassPageState();
}

class _FrostedGlassPageState extends State<FrostedGlassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('模糊效果展示'),
      ),
      body: Stack(
        children: [
          ConstrainedBox(
            // 约束盒子组件，添加额外的约束条件在child上
            constraints: const BoxConstraints.expand(),
            child: Image.network(
              'https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2882417333,796297084&fm=26&gp=0.jpg',
            ),
          ),
          Center(
            child: ClipRect(
              // 可裁剪的距形
              child: BackdropFilter(
                // 背景过滤器 模糊
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    width: double.infinity,
                    height: 300.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                    child: Text(
                      '文字居效果',
                      style: Theme.of(context).textTheme.display3, // 文字颜色使用皮肤效果
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
