import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('消首页各种特效页面'),
        elevation: 0.0, //阴影大小
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text(
                  'flutter数据存储和获取',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/SharedPreferencesPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '滚动渐变拉伸背景效果',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/SliverAppBarPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '抖音我的页面滚动渐变效果',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/DouyinMyPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '抖音摄像拍照实现效果',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/CameraPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '抖音首页实现效果',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/DouyinMainPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '阿里自定义图标库',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/IconsPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '自定义字体',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/FontPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '适配不同的手机做法',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/ScreenutilPage');
                },
              ),
              RaisedButton(
                child: Text(
                  'sliver组件做页面头滚动伸缩显示 和点击水波纹效果',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/SliverDemoPage');
                },
              ),
              RaisedButton(
                child: Text('pageView和GridView使用案例'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/ViewPage');
                },
              ),
              RaisedButton(
                child: Text('打开左右显示侧边栏'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/DrawerPage');
                },
              ),
              RaisedButton(
                child: Text('头部导航栏显示tab选项卡切换效果'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/TopTabsPage');
                },
              ),
              RaisedButton(
                child: Text('相机和图片选择'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/CameraImagePickerPage');
                },
              ),
              RaisedButton(
                child: Text('画廊效果'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/GalleryPage');
                },
              ),
              RaisedButton(
                child: Text('屏幕截图效果'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/CutScreenPage');
                },
              ),
              RaisedButton(
                child: Text('可以吸附顶部的布局'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/AdsorptionViewPage');
                },
              ),
              RaisedButton(
                child: Text('可拖拽的GridView'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/DragAbleGridViewPage');
                },
              ),
              RaisedButton(
                child: Text('上下拉刷新效果'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/PullAndPushPage');
                },
              ),
              RaisedButton(
                child: Text('消息公告上下滚动效果'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/ScrollerMarqueeTextPage');
                },
              ),
              RaisedButton(
                child: Text('跑马灯效果'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/MarqueeWidgetPage');
                },
              ),
              RaisedButton(
                child: Text('模仿京东品质潮男页面的动画效果'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/AnimationWidgetPage');
                },
              ),
              RaisedButton(
                child: Text('文字的开头添加图标或者图片'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/DrawableStartTextPage');
                },
              ),
              RaisedButton(
                child: Text('雷达图（蜘蛛网图）'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/RadarChartPage');
                },
              ),
              RaisedButton(
                child: Text('水波纹效果'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/BezierCurvePage');
                },
              ),
              RaisedButton(
                child: Text('汽车仪表盘模拟'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/DashBoardPage');
                },
              ),
              RaisedButton(
                child: Text('菜单控制形状'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/BlendModesPage');
                },
              ),
              RaisedButton(
                child: Text('登陆按钮的动画效果页面'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/LoginButtonAnimationPage');
                },
              ),
              RaisedButton(
                child: Text('泡泡往上冒的动画效果页面'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/BubblesPage');
                },
              ),
              RaisedButton(
                child: Text('自定义仿IOS时间选择器'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/IosTimePackerPage');
                },
              ),
              RaisedButton(
                child: Text('案例登录页面'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/LoginPage');
                },
              ),
              RaisedButton(
                child: Text('gestureDetector 手势事件'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/GestureDetectorPage');
                },
              ),
              RaisedButton(
                child: Text('gridViewBuilder 布局页面'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/GridViewBuilderPage');
                },
              ),
              RaisedButton(
                child: Text('gridViewExtent 布局页面'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/GridViewExtentPage');
                },
              ),
              RaisedButton(
                child: Text('gridViewCount 布局页面'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/GridViewCountPage');
                },
              ),
              RaisedButton(
                child: Text('gridView 布局页面'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/GridViewPage');
                },
              ),
              RaisedButton(
                child: Text('listViewSeparated 布局页面'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/ListViewSeparatedPage');
                },
              ),
              RaisedButton(
                child: Text('listViewBuilder 布局页面'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/ListViewBuilderPage');
                },
              ),
              RaisedButton(
                child: Text('ListView 布局页面'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/ListViewPage');
                },
              ),
              RaisedButton(
                child: Text('Swiper 轮播图'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/SwiperPage');
                },
              ),
              RaisedButton(
                child: Text('第三方请求数据http和dio的使用'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/DioAndHttpPage');
                },
              ),
              RaisedButton(
                child: Text('flex 弹性布局'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //按钮背景颜色
                onPressed: () {
                  Navigator.pushNamed(context, '/FlexPage');
                },
              ),
              RaisedButton(
                child: Text('wrap 布局换行 lable 标签'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/WrapPage');
                },
              ),
              RaisedButton(
                child: Text('表单验证输入框'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/TextFormFieldPage');
                },
              ),
              RaisedButton(
                child: Text('表单提交'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/FormTextFieldPage');
                },
              ),
              RaisedButton(
                child: Text('自定义上拉加载和下拉刷新'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/CustomRefreshPage');
                },
              ),
              RaisedButton(
                child: Text('easyrefresh插件上拉加载和下拉刷新'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/EasyrefreshPage');
                },
              ),
              RaisedButton(
                child: Text('按下拖动排序'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/DragSortPage');
                },
              ),
              RaisedButton(
                child: Text('仿微信左滑删除一项'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/SwipeDeletePage');
                },
              ),
              RaisedButton(
                child: Text('第三方日期选择picker'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  //Navigator.pushNamed(context, '/PickerDateTimePage');
                },
              ),
              RaisedButton(
                child: Text('flutter自带日期选择弹出框'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/DateTimePage');
                },
              ),
              RaisedButton(
                child: Text('dialog 各种弹出框和自定义弹出框'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/DialogPage');
                },
              ),
              RaisedButton(
                child: Text('自定义头部导航栏渐变效果'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/AppBarShowPage');
                },
              ),
              RaisedButton(
                child: Text('跳转自定义头部按钮'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/CustomAppbarPage');
                },
              ),
              RaisedButton(
                child: Text('返回顶部'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/ReturnTopPage');
                },
              ),
              RaisedButton(
                child: Text('自定义验证码插件输入框'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/VerifiCodePage');
                },
              ),
              RaisedButton(
                child: Text('自定义密码插件输入框'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/InputPasswordPage');
                },
              ),
              RaisedButton(
                child: Text('倒计时'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/CountdownTimePage');
                },
              ),
              RaisedButton(
                child: Text('按钮页面'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/ButtonPage');
                },
              ),
              RaisedButton(
                child: Text('整屏页面切换'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/ScreenPage');
                },
              ),
              RaisedButton(
                child: Text('有状态组件--传参'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/ArgumentsFulPage', arguments: {
                    //统一方法的传递参数
                    'title': '我是有状态组件'
                  });
                },
              ),
              RaisedButton(
                child: Text('无状态组件--传参'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/ArgumentsLessPage',
                    arguments: {
                      //统一方法的传递参数
                      'title': '我是无状态组件'
                    },
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
