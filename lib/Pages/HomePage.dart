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
                  '启动页面预览效果8',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/SmartWalletOnboardingPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '启动页面预览效果7',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/LandingOnePage');
                },
              ),
              RaisedButton(
                child: Text(
                  '启动页面预览效果2',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/IntroTwoPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '启动页面预览效果6',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/IntroSixPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '启动页面预览效果5',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/IntroFivesPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '启动页面预览效果',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/IntroFourPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '点击图像查看预览效果',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/ImagePopupPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '照片点击放大和滚动显示头部导航',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/SliverAppbarPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '照片墙布局',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/GalleryPageOne');
                },
              ),
              RaisedButton(
                child: Text(
                  '我的页面布局效果',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/ProfileUser');
                },
              ),
              RaisedButton(
                child: Text(
                  '购物页面布局效果',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/EcommerceFourPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '首页布局效果',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/EcommerceOnePage');
                },
              ),
              RaisedButton(
                child: Text(
                  '图片裁剪效果',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/CropPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '暗抽屉导航',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/DarkDrawerPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '亮抽屉式导航',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/LightDrawerPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '底部导航动画效果',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/FancyBottomBarPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '导航效果',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/MenuOnePage');
                },
              ),
              RaisedButton(
                child: Text(
                  '导航隐藏效果',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/HiddenMenuPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '登录UI页面效果',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/AuthThreePage');
                },
              ),
              RaisedButton(
                child: Text(
                  '图片卡片放大动画效果',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/AnimationOnePage');
                },
              ),
              RaisedButton(
                child: Text(
                  '简单的应用栏隐藏动画',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/FancyAppbarAnimation');
                },
              ),
              RaisedButton(
                child: Text(
                  '水波波纹动画效果',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/WaveDemoHomePage');
                },
              ),
              RaisedButton(
                child: Text(
                  '很棒的底部弹出框',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/BottomSheetAwesome');
                },
              ),
              RaisedButton(
                child: Text(
                  'facebook脸书App首页实现',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/FaceBookAppPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '抖音短视频App',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/RootApp');
                },
              ),
              RaisedButton(
                child: Text(
                  '使用支付宝支付',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/AlipayTobiasPage');
                },
              ),
              RaisedButton(
                child: Text(
                  'Canvas的各种使用方式',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/CanvasPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '控制器照片视图',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/ControllerPhotoViewPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '图片剪裁效果',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/ClippedPhotoViewPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '多张图片预览效果',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/GalleryPageDemo');
                },
              ),
              RaisedButton(
                child: Text(
                  '图片预览效果',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/SimplePhotoViewPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '一个很棒的App启动介绍动画的库',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/IntroViewsPage');
                },
              ),
              RaisedButton(
                child: Text(
                  'App启动时候应用介绍页',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/IntroSliderPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '从本地相册选取多张图片',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/LoadImagePage');
                },
              ),
              RaisedButton(
                child: Text(
                  '使用url_launcher唤醒功能',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/UrlLauncherPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '在当前页面上覆盖新的组件overlay',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/OverlayDemo');
                },
              ),
              RaisedButton(
                child: Text(
                  '1.在当前页面上覆盖新的组件overlay',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/OverlayDemo1');
                },
              ),
              RaisedButton(
                child: Text(
                  '2.在当前页面上覆盖新的组件overlay',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/OverlayDemo2');
                },
              ),
              RaisedButton(
                child: Text(
                  '右滑返回上一页',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/RightBackDemoPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '应用开启进入闪屏页,然后跳转到首页',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/SplashScreenPage',
                    arguments: {'flage': 1},
                  );
                },
              ),
              RaisedButton(
                child: Text(
                  '普通返回上一页时弹出提示信息',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/WillPopScpoeDemo');
                },
              ),
              RaisedButton(
                child: Text(
                  '利用Form表单onWillPop返回上一页时弹出提示信息',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/FormPopDemoPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '微信九宫格效果',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/WarpDemoPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '制作一个精美的Material风格搜索框',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/SearchBarDemo');
                },
              ),
              RaisedButton(
                child: Text(
                  '在多个页面中切换，并保持原页面状态',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/KeepAliveDemo');
                },
              ),
              RaisedButton(
                child: Text(
                  '可拖动组件draggable',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/DraggablePage');
                },
              ),
              RaisedButton(
                child: Text(
                  '制作刮刮卡效果',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/ScratcherDemo');
                },
              ),
              RaisedButton(
                child: Text(
                  '仿iPhone锁屏界面',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/PassCodeScreenDemo');
                },
              ),
              RaisedButton(
                child: Text(
                  '水波效果的进度器',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/LiquidProgressIndicatorDemo');
                },
              ),
              RaisedButton(
                child: Text(
                  '液体效果的页面切换组件',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/LiquidSwipeDemo');
                },
              ),
              RaisedButton(
                child: Text(
                  '可翻转的卡片组件',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/FlipCardDemo');
                },
              ),
              RaisedButton(
                child: Text(
                  '可自定义的评分组件',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/FlutterRatingBarDemo');
                },
              ),
              RaisedButton(
                child: Text(
                  'flutter将widget裁剪成各种自定义形状',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/FlutterCustomClippersDemo');
                },
              ),
              RaisedButton(
                child: Text(
                  '可展开选项的浮动按钮',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/FlutterSpeedDialDemo');
                },
              ),
              RaisedButton(
                child: Text(
                  '文字动效组件',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/AnimatedTextKitPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '拖动排序元素',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/DragListPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '可定制的上下滑出抽屉',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/SlidingUpPanelPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '超酷动画的底部tab栏',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/CurvedNavigationBarPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '圆形和线形的进度条',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/PercentIndicatorPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '真正意义上的Toast,目前配置还不能使用',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/BotToastDemoPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '可滑动列表按钮选项，内置定向滑动删除动作',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/SlidablePage');
                },
              ),
              RaisedButton(
                child: Text(
                  '可定制的图片预览查看器',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/PhotoViewPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '点赞按钮动画',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/LikeButtonAnimationPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '列表动画效果',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/StaggeredAnimationsPage');
                },
              ),
              RaisedButton(
                child: Text(
                  '滚动粘贴头部效果',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/StickyHeadersPage');
                },
              ),
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
                child: Text('屏幕截屏效果'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/CutScreenPage');
                },
              ),
              RaisedButton(
                child: Text('屏幕截屏效果实现方式'),
                color: Theme.of(context).accentColor, //使用主题颜色
                textTheme: ButtonTextTheme.primary, //
                onPressed: () {
                  Navigator.pushNamed(context, '/WidgetToImageDemo');
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
