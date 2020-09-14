import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class StaggeredAnimationsPage extends StatefulWidget {
  StaggeredAnimationsPage({Key key}) : super(key: key);

  @override
  _StaggeredAnimationsPageState createState() =>
      _StaggeredAnimationsPageState();
}

class _StaggeredAnimationsPageState extends State<StaggeredAnimationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('列表动画'),
        elevation: 0.0, // 头部阴影效果
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridViewDemo(),
      ),
    );
  }
}

//  ListView 列表动画
class ListViewBuilderDemo extends StatelessWidget {
  const ListViewBuilderDemo({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              //滑动动画
              verticalOffset: 50.0,
              child: FadeInAnimation(
                //渐隐渐现动画
                child: Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.blue,
                  height: 60,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// GridView  列表动画
class GridViewDemo extends StatelessWidget {
  const GridViewDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        itemCount: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素个数
            crossAxisCount: 3,
            //纵轴间距
            mainAxisSpacing: 10.0,
            //横轴间距
            crossAxisSpacing: 10.0,
            //子组件宽高长度比例
            childAspectRatio: 1.0),
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            columnCount: 20,
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: Container(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Column  列表动画
class ColumnDemo extends StatelessWidget {
  const ColumnDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Column(
          children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 375),
              childAnimationBuilder: (widget) => SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
              children: ChildrenList())),
    );
  }

  List<Widget> ChildrenList() {
    List<Widget> childs = [];
    for (var i = 0; i < 20; i++) {
      childs.add(Container(
        margin: EdgeInsets.all(5),
        color: Colors.blue,
        height: 60,
      ));
    }
    return childs;
  }
}

// Row 列表动画
class RowDemo extends StatelessWidget {
  const RowDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Container(
        height: 60,
        child: Row(
            children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 375),
                childAnimationBuilder: (widget) => SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                children: ChildrenList())),
      ),
    );
  }

  List<Widget> ChildrenList() {
    List<Widget> childs = [];
    for (var i = 0; i < 20; i++) {
      childs.add(Container(
        margin: EdgeInsets.only(right: 5),
        color: Colors.blue,
        width: 60,
      ));
    }
    return childs;
  }
}
