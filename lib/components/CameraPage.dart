import 'dart:math';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraPage extends StatefulWidget {
  CameraPage({Key key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController _controller;
  var cameras;
  bool isVidoStart = false;
  @override
  void initState() {
    super.initState();
    //getCameras();
  }

  getCameras() async {
    cameras = await availableCameras();
    _controller = CameraController(cameras[1], ResolutionPreset.medium);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      _controller.startImageStream((CameraImage availableImage) {
        _controller.stopImageStream();
      });
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    final size = MediaQuery.of(context).size;
    double toTop = 100 * rpx;
    double outBox = 170 * rpx;
    double innerBox = 130 * rpx;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: <Widget>[
        // 照相机 相机准备成功
        // _controller.value.isInitialized
        //     ? ClipRect(
        //         child: Transform.scale(
        //           scale: _controller.value.aspectRatio / size.aspectRatio,
        //           child: Center(
        //             child: AspectRatio(
        //               aspectRatio: _controller.value.aspectRatio,
        //               child: CameraPreview(_controller),
        //             ),
        //           ),
        //         ),
        //       )
        //     : Container(),
        //顶部关闭按钮
        Positioned(
          top: toTop,
          left: 30 * rpx,
          child: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 60 * rpx,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        //选择音乐
        Positioned(
          top: toTop,
          left: 250 * rpx,
          child: Container(
            width: 250 * rpx,
            child: FlatButton(
              onPressed: () {
                print('选择音乐');
              },
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.music_note,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10 * rpx,
                  ),
                  Text(
                    "选择音乐",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        //拍照按钮
        Positioned(
          bottom: 140 * rpx,
          // left: (750*rpx-outBox)/2,
          child: Container(
            width: 750 * rpx,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconWithText(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  text: "道具",
                ),
                isVidoStart
                    ? AnimVideoButton(
                        rpx: rpx,
                        outWidth: outBox,
                        innerWidth: innerBox - 30 * rpx,
                      )
                    : CircleTakePhoto(
                        outBox: outBox,
                        innerBox: innerBox,
                        ontap: () {
                          setState(() {
                            isVidoStart = !isVidoStart;
                          });
                        },
                      ),
                IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(
                    Icons.check_circle,
                    color: Color.fromARGB(255, 219, 48, 85),
                    size: 80 * rpx,
                  ),
                  onPressed: () async {
                    setState(() {
                      isVidoStart = !isVidoStart;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        // 底部滚动选择拍摄类型
        Positioned(
          bottom: 40 * rpx,
          child: ScrollBottomBar(
            rpx: rpx,
          ),
        ),
        // 切换摄像头
        Positioned(
          right: 30 * rpx,
          top: 80 * rpx,
          child: IconButton(
              icon: Icon(Icons.camera_front),
              onPressed: () {
                print('照相机');
              }),
        ),
      ]),
    );
  }
}

// 底部滚动监听
class ScrollBottomBar extends StatefulWidget {
  ScrollBottomBar({Key key, @required this.rpx}) : super(key: key);
  final double rpx;

  @override
  _ScrollBottomBarState createState() => _ScrollBottomBarState();
}

class _ScrollBottomBarState extends State<ScrollBottomBar> {
  double rpx;
  double eachWidth;
  double eachSide;
  List<String> items;
  ScrollController controller;
  double startX = 0;
  double finalX = 0;
  double minValue;
  double maxValue;
  double curX;
  int curIndex;
  @override
  void initState() {
    super.initState();
    rpx = widget.rpx;
    eachWidth = 130 * rpx;
    eachSide = (750 - eachWidth / rpx) / 2 * rpx;
    curIndex = 2;
    minValue = 0;

    items = [
      '拍照',
      '拍15秒',
      '拍60秒',
      '影集',
      '开直播',
    ];
    maxValue = (items.length - 1) * eachWidth;
    curX = curIndex * eachWidth;
    controller = ScrollController(initialScrollOffset: curX);
  }

  moveToItem(index) {
    curX = index * eachWidth;
    controller.animateTo(curX,
        duration: Duration(milliseconds: 200), curve: Curves.linear);
    setState(() {
      curX = curX;
      curIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Listener(
          onPointerDown: (result) {
            setState(() {
              startX = result.position.dx;
            });
          },
          onPointerMove: (result) {
            double moveValue = result.position.dx;
            double moved = startX - moveValue;
            // curX+moved
            double afterMoved = min(max(curX + moved, minValue), maxValue);
            setState(() {
              curX = afterMoved;
              startX = result.position.dx;
            });
          },
          onPointerUp: (result) {
            int index = 0;
            double finalPosition = curX - eachWidth / 2;
            index = (finalPosition / eachWidth).ceil();
            moveToItem(index);
            print('选择第$index个');
          },
          child: Container(
            width: 750 * rpx,
            height: 100 * rpx,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: controller,
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      width: eachSide,
                    ),
                    Row(
                      children: List.generate(
                        items.length,
                        (index) {
                          return Container(
                            width: eachWidth,
                            child: FlatButton(
                              child: Text(
                                items[index],
                                style: TextStyle(
                                    color: curIndex == index
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.5)),
                              ),
                              padding: EdgeInsets.all(0),
                              onPressed: () {
                                moveToItem(index);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: eachSide,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            width: 8 * rpx,
            height: 8 * rpx,
          ),
        )
      ],
    );
  }
}

// 点击中间按钮动画
class AnimVideoButton extends StatefulWidget {
  AnimVideoButton({
    Key key,
    @required this.outWidth,
    @required this.innerWidth,
    @required this.rpx,
  }) : super(key: key);
  final double outWidth;
  final double innerWidth;
  final double rpx;
  _AnimVideoButtonState createState() => _AnimVideoButtonState();
}

class _AnimVideoButtonState extends State<AnimVideoButton>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  double outWidth;
  double innerWidth;
  double outBorder;
  double rpx;
  double maxBorder;
  bool ifRecording;
  double curBorder;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    ifRecording = true;
    outWidth = widget.outWidth;
    innerWidth = widget.innerWidth;
    rpx = widget.rpx;
    outBorder = 5 * rpx;
    maxBorder = (outWidth - innerWidth) / 2 - 10 * rpx;
    curBorder = outBorder;
    controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    animation =
        Tween<double>(begin: outBorder, end: maxBorder).animate(controller)
          ..addListener(() {
            setState(() {
              curBorder = animation.value;
            });
          });
    controller.repeat(reverse: true);
  }

  pauseRecording() {
    controller.stop();

    setState(() {
      ifRecording = false;
    });
  }

  resumeRecording() {
    controller.repeat(reverse: true);

    setState(() {
      ifRecording = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: outWidth,
      height: outWidth,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(
              width: curBorder, color: Color.fromARGB(128, 219, 48, 85))),
      child: Container(
        child: !ifRecording
            ? IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  Icons.play_arrow,
                  size: innerWidth,
                  color: Color.fromARGB(255, 219, 48, 85),
                ),
                onPressed: () {
                  resumeRecording();
                },
              )
            : IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  Icons.pause,
                  size: innerWidth,
                  color: Color.fromARGB(255, 219, 48, 85),
                ),
                onPressed: () {
                  pauseRecording();
                },
              ),
      ),
    );
  }
}

// 中间点击按钮
class CircleTakePhoto extends StatelessWidget {
  const CircleTakePhoto(
      {Key key, @required this.outBox, @required this.innerBox, this.ontap})
      : super(key: key);
  final double outBox;
  final double innerBox;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    // double outBox=160*rpx;
    // double innerBox=130*rpx;
    return Container(
      width: outBox,
      height: outBox,
      padding: EdgeInsets.all(10 * rpx),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(90 * rpx),
        border: Border.all(
          width: 10 * rpx,
          color: Color.fromARGB(128, 219, 48, 85),
        ),
      ),
      child: FlatButton(
        shape: CircleBorder(
          side: BorderSide(color: Color.fromARGB(255, 219, 48, 85)),
        ),
        padding: EdgeInsets.all(0),
        onPressed: () async {
          ontap();
          print('点击了');
        },
        child: Container(
          width: innerBox,
          height: innerBox,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 219, 48, 85),
            //borderRadius: BorderRadius.circular(75 * rpx),
          ),
        ),
      ),
    );
  }
}

// 图标和文字
class IconWithText extends StatelessWidget {
  const IconWithText({Key key, @required this.icon, @required this.text})
      : super(key: key);
  final Icon icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        icon,
        Text(
          text,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
