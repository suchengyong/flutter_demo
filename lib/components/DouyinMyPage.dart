import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

class DouyinMyPage extends StatefulWidget {
  DouyinMyPage({Key key}) : super(key: key);

  @override
  _DouyinMyPageState createState() => _DouyinMyPageState();
}

class _DouyinMyPageState extends State<DouyinMyPage> {
  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return Scaffold(
      body: Container(
        child: HomeMain(
          rpx: rpx,
        ),
      ),
    );
  }
}

///
class HomeMain extends StatefulWidget {
  HomeMain({Key key, @required this.rpx}) : super(key: key);
  final double rpx;
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> with TickerProviderStateMixin {
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
              onPressed: () {},
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: TabBar(
                controller: tabController,
                tabs: <Widget>[
                  Text("作品 91"),
                  Text("动态 91"),
                  Text("喜欢 91"),
                ],
              ),
            ),
            //expandedHeight: 500 * rpx + extraPicHeight,
            expandedHeight: expanedHeight + extraPicHeight,
            flexibleSpace: TopBarWithCallback(
              extraPicHeight: extraPicHeight,
              fitType: fitType,
              updateHeight: updateExpandedHeight,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 30,
                alignment: Alignment.centerLeft,
                color: Colors.blueAccent,
                child: Text("This is itm $index"),
                margin: EdgeInsets.symmetric(
                    horizontal: 20 * rpx, vertical: 10 * rpx),
              );
            }, childCount: 80),
          )
        ],
      ),
    );
  }
}

///
class TopBarWithCallback extends StatefulWidget {
  TopBarWithCallback(
      {Key key,
      @required this.extraPicHeight,
      @required this.fitType,
      @required this.updateHeight})
      : super(key: key);
  final double extraPicHeight;
  final BoxFit fitType;
  final Function(double) updateHeight;
  _TopBarWithCallbackState createState() => _TopBarWithCallbackState();
}

class _TopBarWithCallbackState extends State<TopBarWithCallback>
    with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliverTopBar(
        extraPicHeight: widget.extraPicHeight,
        fitType: widget.fitType,
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    RenderBox box = context.findRenderObject();
    double height =
        box.getMaxIntrinsicHeight(MediaQuery.of(context).size.width);
    widget.updateHeight(height);
  }
}

///
class SliverTopBar extends StatelessWidget {
  const SliverTopBar(
      {Key key, @required this.extraPicHeight, @required this.fitType})
      : super(key: key);
  final double extraPicHeight;
  final BoxFit fitType;
  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Image.asset(
              "assets/images/2.jpg",
              width: 750 * rpx,
              height: 300 * rpx + extraPicHeight,
              fit: fitType,
            ),
            Container(
              padding: EdgeInsets.only(top: 20 * rpx),
              height: 120 * rpx,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 80 * rpx,
                    width: 330 * rpx,
                    child: RaisedButton(
                      color: Colors.black,
                      child: Text(
                        "+关注",
                        style: TextStyle(
                            fontSize: 30 * rpx,
                            color: Colors.white,
                            letterSpacing: 3 * rpx),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Color(0xff3b3c49),
                    ),
                    height: 80 * rpx,
                    child: IconButton(
                      icon: Center(
                          child: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 50 * rpx,
                      )),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 750 * rpx,
              padding: EdgeInsets.symmetric(horizontal: 30 * rpx),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "苏成勇",
                    style: TextStyle(
                        fontSize: 40 * rpx,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("抖音号:1234567",
                      style: TextStyle(
                        fontSize: 25 * rpx,
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: 15 * rpx,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20 * rpx),
              child: Divider(
                color: Colors.grey[700],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20 * rpx),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.shop,
                        color: Color(0xffeacd3f),
                      ),
                      Text(
                        "商品橱窗",
                        style: TextStyle(color: Color(0xffeacd3f)),
                      )
                    ],
                  ),
                  Icon(Icons.keyboard_arrow_right, color: Color(0xffeacd3f))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20 * rpx),
              child: Divider(
                color: Colors.grey[700],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20 * rpx),
              height: 100 * rpx,
              width: 750 * rpx,
              child: Text(
                "爱神的箭发；黑色大力开发哈的\n阿萨德饭还是电话费拉开始的计划发",
                style: TextStyle(color: Colors.white, fontSize: 25 * rpx),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20 * rpx,
                vertical: 10 * rpx,
              ),
              child: Row(
                children: <Widget>[
                  Tag(
                    text: "深圳",
                  ),
                  Tag(
                    text: "世界之窗",
                  ),
                  Tag(
                    text: "深圳大学",
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20 * rpx,
                vertical: 30 * rpx,
              ),
              child: Row(
                children: <Widget>[
                  NumWithDesc(
                    numm: "100.2w",
                    desc: "获赞",
                  ),
                  NumWithDesc(
                    numm: "15",
                    desc: "关注",
                  ),
                  NumWithDesc(
                    numm: "10.8w",
                    desc: "粉丝",
                  ),
                ],
              ),
            )
          ],
        ),
        Positioned(
          top: 250 * rpx + extraPicHeight,
          left: 30 * rpx,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(220 * rpx),
            ),
            width: 120 * rpx,
            height: 120 * rpx,
            padding: EdgeInsets.all(10 * rpx),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://pic2.zhimg.com/v2-a88cd7618933272ca681f86398e6240d_xll.jpg",
              ),
            ),
          ),
        )
      ],
    );
  }
}

/// 标签
class Tag extends StatelessWidget {
  const Tag({Key key, @required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return Container(
      child: Text(
        text,
        style: TextStyle(fontSize: 23 * rpx, color: Color(0xff64626e)),
      ),
      color: Colors.white,
      padding: EdgeInsets.all(10 * rpx),
      margin: EdgeInsets.only(right: 10 * rpx),
    );
  }
}

///获赞和关注和粉丝
class NumWithDesc extends StatelessWidget {
  const NumWithDesc({Key key, @required this.numm, @required this.desc})
      : super(key: key);
  final String numm;
  final String desc;
  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    double textSize = 28 * rpx;
    return Padding(
      padding: EdgeInsets.only(right: 20 * rpx),
      child: Row(
        children: <Widget>[
          Text(
            numm,
            style: TextStyle(
                fontSize: textSize,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 10 * rpx,
          ),
          Text(
            desc,
            style: TextStyle(
              fontSize: textSize,
              color: Color(0xff3b3c49),
            ),
          )
        ],
      ),
    );
  }
}
