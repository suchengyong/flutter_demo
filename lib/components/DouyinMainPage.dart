import 'package:flutter/material.dart';
import 'widgets/MarqueeWidget.dart';
import 'package:video_player/video_player.dart';

class DouyinMainPage extends StatefulWidget {
  DouyinMainPage({Key key}) : super(key: key);

  @override
  _DouyinMainPageState createState() => _DouyinMainPageState();
}

class _DouyinMainPageState extends State<DouyinMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DouyinHomePage(),
    );
  }
}

class DouyinHomePage extends StatelessWidget {
  const DouyinHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 获取设备屏幕的宽度和高度
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double toBottom = MediaQuery.of(context).viewInsets.bottom;
    double rpx = MediaQuery.of(context).size.width / 750;
    //获取安全区的padding
    // MediaQuery.of(context).padding.top
    // MediaQuery.of(context).padding.bottom
    print(MediaQuery.of(context));
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.vertical,
            onPageChanged: (currentPage) => debugPrint('Page: $currentPage'),
            controller: PageController(
              initialPage: 1,
              keepPage: true,
              viewportFraction: 1,
            ),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  SizedBox.expand(
                    child: Center(
                      child: VideoPlay(),
                    ),
                    // Image.asset(
                    //   'assets/images/chaonan2.jpg',
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  Positioned(
                    bottom: 80,
                    width: 0.7 * screenWidth,
                    height: 150,
                    child: Container(
                      width: 0.7 * screenWidth,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              '@人民日报',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25 * rpx),
                            ),
                            subtitle: Text(
                              '好好的回复覆盖广泛各个地方覆盖方法德国各地泛各个地方覆盖方法德国各地泛各个地方覆盖方法德国各地广泛滚动广告覆盖广泛股份对的地方',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22 * rpx),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.music_note,
                                color: Colors.white,
                              ),
                              Container(
                                height: 30,
                                width: 0.5 * screenWidth,
                                child: MarqueeWidget(
                                  text: "跑马灯效果公告滚动播放案例很多很多文字哦哦哦哦很多很多文字哦哦哦哦",
                                  textStyle: new TextStyle(
                                    fontSize: 25 * rpx,
                                    color: Colors.white,
                                  ),
                                  scrollAxis: Axis.horizontal,
                                  ratioOfBlankToScreen: 0.5,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    width: 0.2 * screenWidth,
                    height: 0.45 * screenHeight,
                    top: 0.3 * screenHeight,
                    child: Container(
                      child: Column(
                        children: [
                          addUser(),
                          SizedBox(height: 5),
                          IconText(
                            text: '999w',
                            icon: Icon(
                              Icons.favorite,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          IconText(
                            text: '99w',
                            icon: Icon(
                              Icons.comment,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          IconText(
                            text: '1999',
                            icon: Icon(
                              Icons.reply,
                              size: 40,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    right: 0,
                    width: 0.25 * screenWidth,
                    height: 0.25 * screenWidth,
                    child: Container(
                      child: RotateAlbum(),
                    ),
                  )
                ],
              );
            },
          ),
          Positioned(
            top: 0,
            height: 80,
            width: screenWidth,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: TopTab(),
            ),
          ),
          Positioned(
            bottom: 0,
            width: screenWidth,
            child: Container(
              height: 70,
              width: screenWidth,
              padding: EdgeInsets.only(bottom: toBottom),
              decoration: BoxDecoration(
                // color: Colors.green,
                border: Border(
                  // 下边框
                  top: BorderSide(
                    color: Colors.grey[600],
                    width: 1.0,
                    style: BorderStyle.solid, // 边框线条
                  ),
                ),
              ),
              child: BottomTabBarsDouyin(),
            ),
          )
        ],
      ),
    );
  }
}

// 视频播放
class VideoPlay extends StatefulWidget {
  VideoPlay({Key key}) : super(key: key);

  _VideoPlayState createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://vd4.bdstatic.com/mda-khntc0674kgi33wq/sc/mda-khntc0674kgi33wq.mp4?playlist=%5B%22hd%22%2C%22sc%22%5D&auth_key=1599537918-0-0-76a3bc98f156722bd8f963389f19d2a2&bcevod_channel=searchbox_feed&pd=1&pt=3');
    // 播放状态
    _controller.addListener(() {
      //final bool isPlaying = _controller.value.isPlaying;
    });
    _controller.setLooping(true);
    _controller.initialize().then((value) => setState(() {
          _controller.play();
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _controller.value.initialized
          // 加载成功
          ? AspectRatio(
              aspectRatio: 16 / 9,
              child: VideoPlayer(_controller),
            )
          : Container(
              color: Colors.black,
            ),
    );
  }
}

// tabbar 切换
class TopTab extends StatefulWidget {
  TopTab({Key key}) : super(key: key);

  @override
  _TopTabState createState() => _TopTabState();
}

class _TopTabState extends State<TopTab> with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 17 * rpx,
        ),
        Icon(
          Icons.search,
          size: 50 * rpx,
          color: Colors.white,
        ),
        Container(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80 * rpx),
            width: 520 * rpx,
            child: TabBar(
              indicatorColor: Colors.white,
              labelStyle: TextStyle(color: Colors.white, fontSize: 28 * rpx),
              indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
              unselectedLabelStyle:
                  TextStyle(color: Colors.grey[700], fontSize: 28 * rpx),
              controller: _controller,
              tabs: <Widget>[Text("关注"), Text("推荐")],
            ),
          ),
        ),
        Icon(
          Icons.live_tv,
          size: 50 * rpx,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

// 底部tabBar 切换
class BottomTabBarsDouyin extends StatefulWidget {
  BottomTabBarsDouyin({Key key}) : super(key: key);

  @override
  _BottomTabBarsState createState() => _BottomTabBarsState();
}

class _BottomTabBarsState extends State<BottomTabBarsDouyin> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                setState(() {
                  isSelected = 0;
                });
              },
              child: btnbars('首页', isSelected, 0),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                setState(() {
                  isSelected = 1;
                });
              },
              child: btnbars('同城', isSelected, 1),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: AddIcon(),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                setState(() {
                  isSelected = 2;
                });
              },
              child: btnbars('消息', isSelected, 2),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                setState(() {
                  isSelected = 3;
                });
              },
              child: btnbars('我的', isSelected, 3),
            ),
          )
        ],
      ),
    );
  }
}

//底部添加按钮
class AddIcon extends StatelessWidget {
  const AddIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 50,
      child: Stack(
        children: [
          Positioned(
            height: 30,
            width: 30,
            left: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Positioned(
            height: 30,
            width: 30,
            right: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Positioned(
            height: 30,
            width: 40,
            right: 5,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}

// 底部按钮封装
Widget btnbars(title, isSelected, index) {
  return Container(
    alignment: Alignment.center,
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected == index ? Colors.white : Colors.grey[600],
            ),
          ),
        ),
        isSelected == index
            ? Container(
                margin: EdgeInsets.only(top: 8),
                height: 2,
                width: 28,
                color: Colors.white)
            : Container(height: 0, width: 0)
      ],
    ),
  );
}

// 旋转的唱片动画
class RotateAlbum extends StatefulWidget {
  RotateAlbum({Key key}) : super(key: key);

  _RotateAlbumState createState() => _RotateAlbumState();
}

class _RotateAlbumState extends State<RotateAlbum>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  var animation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animation = RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_controller)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _controller.forward(from: 0.0);
          }
        }),
      child: Container(
          child: CircleAvatar(
        backgroundImage: NetworkImage(
            "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=328464699,3234196506&fm=26&gp=0.jpg"),
      )),
    );
    _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      child: animation,
    );
  }
}

// 右边按钮组
Widget addUser() {
  return Column(
    children: [
      Container(
        height: 60,
        width: 60,
        child: Stack(
          children: [
            Container(
              width: 50,
              height: 50,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2836835199,1222621246&fm=11&gp=0.jpg'),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 20,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: Icon(
                  Icons.add,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      )
    ],
  );
}

//右边按钮
class IconText extends StatelessWidget {
  final Icon icon;
  final String text;
  IconText({Key key, this.icon, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          icon,
          Container(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 25 * rpx),
            ),
          ),
        ],
      ),
    );
  }
}
