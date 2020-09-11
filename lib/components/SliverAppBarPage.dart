import 'package:flutter/material.dart';

class SliverAppBarPage extends StatefulWidget {
  SliverAppBarPage({Key key}) : super(key: key);

  @override
  _SliverAppBarPageState createState() => _SliverAppBarPageState();
}

class _SliverAppBarPageState extends State<SliverAppBarPage> {
  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return Scaffold(
      body: SliverHomeMain(
        rpx: rpx,
      ),
    );
  }
}

///
class SliverHomeMain extends StatefulWidget {
  SliverHomeMain({Key key, @required this.rpx}) : super(key: key);
  final double rpx;
  _SliverHomeMainState createState() => _SliverHomeMainState();
}

class _SliverHomeMainState extends State<SliverHomeMain>
    with TickerProviderStateMixin {
  double extraPicHeight = 0;
  BoxFit fitType;
  double prevdy;
  double rpx;
  AnimationController animationController;
  Animation<double> anim;
  TabController tabController;
  double expanedHeight = 300;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
    prevdy = 0;
    fitType = BoxFit.fitWidth;
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    anim = Tween(begin: 0.0, end: 0.0).animate(animationController);
  }

  updatePicHeight(changed) {
    if (prevdy == 0) {
      prevdy = changed;
    }
    extraPicHeight += changed - prevdy;
    if (extraPicHeight >= 400 * widget.rpx) {
      fitType = BoxFit.fitHeight;
    } else {
      fitType = BoxFit.fitWidth;
    }
    setState(() {
      prevdy = changed;
      extraPicHeight = extraPicHeight;
      fitType = fitType;
    });
  }

  updateExpandedHeight(height) {
    setState(() {
      expanedHeight = height;
    });
  }

  runAnimate() {
    setState(() {
      anim = Tween(begin: extraPicHeight, end: 0.0).animate(animationController)
        ..addListener(() {
          if (extraPicHeight >= widget.rpx * 200) {
            fitType = BoxFit.fitHeight;
          } else {
            fitType = BoxFit.fitWidth;
          }
          setState(() {
            extraPicHeight = anim.value;
            fitType = fitType;
          });
        });
      prevdy = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return Listener(
      onPointerMove: (result) {
        updatePicHeight(result.position.dy);
      },
      onPointerUp: (_) {
        runAnimate();
        animationController.forward(from: 0);
      },
      child: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: TabBar(
                controller: tabController,
                tabs: <Widget>[
                  Text("作品 91"),
                  Text("动态 91"),
                  Text("喜欢 91"),
                ],
              ),
            ),
            expandedHeight: expanedHeight + extraPicHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: SliverBar(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  height: 30,
                  alignment: Alignment.center,
                  color: Colors.blueAccent,
                  child: Text(
                    "数据第 $index 个",
                    style: TextStyle(color: Colors.white),
                  ),
                  margin: EdgeInsets.symmetric(
                      horizontal: 20 * rpx, vertical: 10 * rpx),
                );
              },
              childCount: 80,
            ),
          )
        ],
      ),
    );
  }
}

class SliverBar extends StatefulWidget {
  SliverBar({Key key}) : super(key: key);

  @override
  _SliverBarState createState() => _SliverBarState();
}

class _SliverBarState extends State<SliverBar> {
  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return Container(
      child: Image.asset(
        "assets/images/2.jpg",
        width: 750 * rpx,
        height: 300 * rpx,
        fit: BoxFit.cover,
      ),
    );
  }
}
