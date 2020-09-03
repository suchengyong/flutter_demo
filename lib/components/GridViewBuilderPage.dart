import 'package:flutter/material.dart';

class GridViewBuilderPage extends StatefulWidget {
  GridViewBuilderPage({Key key}) : super(key: key);

  @override
  _GridViewBuilderPageState createState() => _GridViewBuilderPageState();
}

class _GridViewBuilderPageState extends State<GridViewBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GridViewBuilder 页面标题'),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
                itemCount: 50,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 130, // 指定每一列数的最大宽度
                  mainAxisSpacing: 10, // 没一行之间距离
                  crossAxisSpacing: 5, // 每一列之间距离
                  childAspectRatio: 4 / 3, // 每一个项目的宽度高度比
                ),
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 2, // 指定展示多少列数
                //   mainAxisSpacing: 10, // 没一行之间距离
                //   crossAxisSpacing: 5, // 每一列之间距离
                //   childAspectRatio: 4 / 3, // 每一个项目的宽度高度比
                // ),
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      '第 $index 个',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    color: Colors
                        .primaries[index % Colors.primaries.length], //生成随机颜色,
                  );
                })));
  }
}
