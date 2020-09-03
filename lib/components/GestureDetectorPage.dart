import 'package:flutter/material.dart';

class GestureDetectorPage extends StatefulWidget {
  GestureDetectorPage({Key key}) : super(key: key);

  @override
  _GestureDetectorPageState createState() => _GestureDetectorPageState();
}

class _GestureDetectorPageState extends State<GestureDetectorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('事件 页面标题'),
      ),
      body: GestureMove(),
    );
  }
}

// 手动拖动方块效果动画
class GestureMove extends StatefulWidget {
  GestureMove({Key key}) : super(key: key);

  @override
  _GestureMoveState createState() => _GestureMoveState();
}

class _GestureMoveState extends State<GestureMove> {
  double _left = 0.0;
  double _top = 0.0;
  // 创建一个key 定义组件
  GlobalKey<ScaffoldState> _gKey = GlobalKey<ScaffoldState>();

  double _Stack_Width = 0.0;
  double _Stack_Height = 0.0;
  // 初始化 生命周期
  @override
  void initState() {
    super.initState();
    //监听每一帧结束 的时候回调
    // WidgetsBinding.instance.addPostFrameCallback((callback) {
    //   WidgetsBinding.instance.addPersistentFrameCallback((callback) {
    //     print("addPersistentFrameCallback be invoke");
    //     //触发一帧的绘制
    //     WidgetsBinding.instance.scheduleFrame();
    //   });
    // });
    // 注册一个回调，当屏幕首次渲染第一帧的时候回调 ,只会执行一次
    // 第一帧绘制完成标志着已经Build完成，并交由引擎绘制结束
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      print("addPostFrameCallback be invoke");
      _Stack_Width = _gKey.currentContext.size.width;
      _Stack_Height = _gKey.currentContext.size.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 触摸点不断移动触发事件
      onPanUpdate: (DragUpdateDetails details) {
        //print('width:$_Stack_Width --- height:$_Stack_Height');
        setState(() {
          // 边界检测
          if (_left + 100 > _Stack_Width) {
            _left = _Stack_Width - 100;
          } else if (_left < 0) {
            _left = 0.0;
          } else {
            _left = _left + details.delta.dx; // 左右移动量
          }
          if (_top + 100 > _Stack_Height) {
            _top = _Stack_Height - 100;
          } else if (_top < 0) {
            _top = 0.0;
          } else {
            _top = _top + details.delta.dy; // 上下移动量
          }
        });
        //print('left:$_left ----top:$_top');
      },
      child: Stack(
        key: _gKey,
        children: <Widget>[
          Positioned(
              width: 100,
              height: 100,
              left: _left,
              top: _top,
              child: Container(
                alignment: Alignment.center,
                color: Colors.red,
                child: Text('拖动我',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ))
        ],
      ),
    );
  }
}
