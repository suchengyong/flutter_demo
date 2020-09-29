import 'package:flutter/material.dart';
import '../TabBars/TabBar_CenterButton.dart';
import '../TabBars/BottomTabBars.dart';
import '../components/IconsPage.dart';
import '../components/FontPage.dart';
import '../components/SliverDemoPage.dart';
import '../components/PostShowPage.dart';
import '../components/ScreenutilPage.dart';
import '../components/ViewPage.dart';
import '../components/DrawerPage.dart';
import '../components/TopTabsPage.dart';
import '../components/CameraImagePickerPage.dart';
import '../components/GalleryPage.dart';
import '../components/CutScreenPage.dart';
import '../components/WidgetToImageDemo.dart';
import '../components/AdsorptionViewPage.dart';
import '../components/DragAbleGridViewPage.dart';
import '../components/PullAndPushPage.dart';
import '../components/ScrollerMarqueeTextPage.dart';
import '../components/MarqueeWidgetPage.dart';
import '../components/AnimationWidgetPage.dart';
import '../components/DrawableStartTextPage.dart';
import '../components/RadarChartPage.dart';
import '../components/BezierCurvePage.dart';
import '../components/DashBoardPage.dart';
import '../components/BlendModesPage.dart';
import '../components/LoginButtonAnimationPage.dart';
import '../components/BubblesPage.dart';
import '../components/IosTimePackerPage.dart';
import '../components/LoginPage.dart';
import '../components/GestureDetectorPage.dart';
import '../components/GridViewBuilderPage.dart';
import '../components/GridViewExtentPage.dart';
import '../components/GridViewPage.dart';
import '../components/GridViewCountPage.dart';
import '../components/ListViewSeparatedPage.dart';
import '../components/ListViewBuilderPage.dart';
import '../components/ListViewPage.dart';
import '../components/SwiperPage.dart';
import '../components/DioAndHttpPage.dart';
import '../components/WrapPage.dart';
import '../components/FlexPage.dart';
import '../components/TextFormFieldPage.dart';
import '../components/FormTextFieldPage.dart';
import '../components/CustomRefreshPage.dart';
import '../components/EasyrefreshPage.dart';
import '../components/DragSortPage.dart';
import '../components/SwipeDeletePage.dart';
//import '../components/PickerDateTimePage.dart';
import '../components/DateTimePage.dart';
import '../components/DialogPage.dart';
import '../components/AppBarShowPage.dart';
import '../components/CustomAppbarPage.dart';
import '../components/ReturnTopPage.dart';
import '../components/VerifiCodePage.dart';
import '../components/InputPasswordPage.dart';
import '../components/CountdownTimePage.dart';
import '../components/ButtonPage.dart';
import '../components/ScreenPage.dart';
import '../components/ArgumentsFulPage.dart';
import '../components/ArgumentsLessPage.dart';
import '../components/DouyinMainPage.dart';
import '../components/CameraPage.dart';
import '../components/SharedPreferencesPage.dart';
import '../components/DouyinMyPage.dart';
import '../components/SliverAppBarPage.dart';
import '../components/StickyHeadersPage.dart';
import '../components/StaggeredAnimationsPage.dart';
import '../components/LikeButtonAnimationPage.dart';
import '../components/PhotoViewPage.dart';
import '../components/SlidablePage.dart';
import '../components/BotToastDemoPage.dart';
import '../components/PercentIndicatorPage.dart';
import '../components/CurvedNavigationBarPage.dart';
import '../components/SlidingUpPanelPage.dart';
import '../components/DragListPage.dart';
import '../components/AnimatedTextKitPage.dart';
import '../components/FlutterSpeedDialDemo.dart';
import '../components/FlutterCustomClippersDemo.dart';
import '../components/FlutterRatingBarDemo.dart';
import '../components/FlipCardDemo.dart';
import '../components/LiquidSwipeDemo.dart';
import '../components/LiquidProgressIndicatorDemo.dart';
import '../components/PassCodeScreenDemo.dart';
import '../components/ScratcherDemo.dart';
import '../components/DraggablePage.dart';
import '../components/KeepAliveDemo.dart';
import '../components/SearchBarDemo.dart';
import '../components/WarpDemoPage.dart';
import '../components/FormPopDemoPage.dart';
import '../components/WillPopScpoeDemo.dart';
import '../components/SplashScreenPage.dart';
import '../components/RightBackDemoPage.dart';
import '../components/OverlayDemo.dart';
import '../components/OverlayDemo1.dart';
import '../components/OverlayDemo2.dart';
import '../components/UrlLauncherPage.dart';
import '../components/LoadImagePage.dart';
import '../components/IntroSliderPage.dart';
import '../components/IntroViewsPage.dart';
import '../components/SimplePhotoViewPage.dart';
import '../components/GalleryPageDemo.dart';
import '../components/ClippedPhotoViewPage.dart';
import '../components/ControllerPhotoViewPage.dart';
import '../components/CanvasPage.dart';
import '../components/AlipayTobiasPage.dart';
import '../components/TiktokApp/pages/root_app.dart';
import '../components/FacebookApp/pages/home_page.dart';
import '../components/BottomSheetAwesome.dart';
import '../components/WaveDemoHomePage.dart';
import '../components/UI/animations/FancyAppbarAnimation.dart';
import '../components/UI/animations/AnimationOnePage.dart';
import '../components/UI/login/AuthThreePage.dart';
import '../components/UI/navigation/MenuOnePage.dart';
import '../components/UI/navigation/HiddenMenuPage.dart';
import '../components/UI/navigation/LightDrawerPage.dart';
import '../components/UI/navigation/DarkDrawerPage.dart';
import '../components/UI/navigation/FancyBottomBarPage.dart';
import '../components/UI/others/CropPage.dart';
import '../components/UI/others/EcommerceOnePage.dart';
import '../components/UI/others/EcommerceFourPage.dart';
import '../components/UI/others/ProfileUser.dart';
import '../components/UI/others/GalleryPageOne.dart';
import '../components/UI/others/SliverAppbarPage.dart';
import '../components/UI/others/ImagePopupPage.dart';
import '../components/UI/onboarding/IntroFourPage.dart';
import '../components/UI/onboarding/InitOnePage.dart';
import '../components/UI/onboarding/IntroFivesPage.dart';
import '../components/UI/onboarding/IntroSixPage.dart';
import '../components/UI/onboarding/IntroTwoPage.dart';
import '../components/UI/onboarding/LandingOnePage.dart';
import '../components/UI/onboarding/SmartWalletOnboardingPage.dart';
import '../components/audioplayers/IndexPlayerList.dart';
import '../components/UI/onboarding/SpeakAnim.dart';
import '../components/Calculator/CalculatorPage.dart';
import '../components/JsonChangeDataPage.dart';
import '../components/FrostedGlassPage.dart';
import '../components/CurveTwoCuttingPage.dart';
import '../components/CurveWaveCuttingPage.dart';
import '../components/TooltipPage.dart';

//配置路由
final routes = {
  '/TooltipPage': (context) => TooltipPage(),
  '/CurveWaveCuttingPage': (context) => CurveWaveCuttingPage(),
  '/CurveTwoCuttingPage': (context) => CurveTwoCuttingPage(),
  '/FrostedGlassPage': (context) => FrostedGlassPage(),
  '/JsonChangeDataPage': (context) => JsonChangeDataPage(),
  '/CalculatorPage': (context) => CalculatorPage(),
  '/SpeakAnim': (context) => SpeakAnim(),
  '/IndexPlayerList': (context) => IndexPlayerList(),
  '/SmartWalletOnboardingPage': (context) => SmartWalletOnboardingPage(),
  '/LandingOnePage': (context) => LandingOnePage(),
  '/IntroTwoPage': (context) => IntroTwoPage(),
  '/IntroSixPage': (context) => IntroSixPage(),
  '/InitOnePage': (context) => InitOnePage(),
  '/IntroFivesPage': (context) => IntroFivesPage(),
  '/IntroFourPage': (context) => IntroFourPage(),
  '/ImagePopupPage': (context) => ImagePopupPage(),
  '/SliverAppbarPage': (context) => SliverAppbarPage(),
  '/GalleryPageOne': (context) => GalleryPageOne(),
  '/ProfileUser': (context) => ProfileUser(),
  '/EcommerceFourPage': (context) => EcommerceFourPage(),
  '/EcommerceOnePage': (context) => EcommerceOnePage(),
  '/CropPage': (context) => CropPage(),
  '/FancyBottomBarPage': (context) => FancyBottomBarPage(),
  '/DarkDrawerPage': (context) => DarkDrawerPage(),
  '/LightDrawerPage': (context) => LightDrawerPage(),
  '/HiddenMenuPage': (context) => HiddenMenuPage(),
  '/MenuOnePage': (context) => MenuOnePage(),
  '/AuthThreePage': (context) => AuthThreePage(),
  '/AnimationOnePage': (context) => AnimationOnePage(),
  '/FancyAppbarAnimation': (context) => FancyAppbarAnimation(),
  '/WaveDemoHomePage': (context) => WaveDemoHomePage(),
  '/BottomSheetAwesome': (context) => BottomSheetAwesome(),
  '/FaceBookAppPage': (context) => FaceBookAppPage(),
  '/RootApp': (context) => RootApp(),
  '/AlipayTobiasPage': (context) => AlipayTobiasPage(),
  '/CanvasPage': (context) => CanvasPage(),
  '/ControllerPhotoViewPage': (context) => ControllerPhotoViewPage(),
  '/ClippedPhotoViewPage': (context) => ClippedPhotoViewPage(),
  '/GalleryPageDemo': (context) => GalleryPageDemo(),
  '/SimplePhotoViewPage': (context) => SimplePhotoViewPage(),
  '/IntroViewsPage': (context) => IntroViewsPage(),
  '/IntroSliderPage': (context) => IntroSliderPage(),
  '/LoadImagePage': (context) => LoadImagePage(),
  '/UrlLauncherPage': (context) => UrlLauncherPage(),
  '/OverlayDemo2': (context) => OverlayDemo2(),
  '/OverlayDemo1': (context) => OverlayDemo1(),
  '/OverlayDemo': (context) => OverlayDemo(),
  '/RightBackDemoPage': (context) => RightBackDemoPage(),
  '/SplashScreenPage': (context, {arguments}) =>
      SplashScreenPage(arguments: arguments),
  '/WillPopScpoeDemo': (context) => WillPopScpoeDemo(),
  '/FormPopDemoPage': (context) => FormPopDemoPage(),
  '/WarpDemoPage': (context) => WarpDemoPage(),
  '/SearchBarDemo': (context) => SearchBarDemo(),
  '/KeepAliveDemo': (context) => KeepAliveDemo(),
  '/DraggablePage': (context) => DraggablePage(),
  '/ScratcherDemo': (context) => ScratcherDemo(),
  '/PassCodeScreenDemo': (context) => PassCodeScreenDemo(),
  '/LiquidProgressIndicatorDemo': (context) => LiquidProgressIndicatorDemo(),
  '/LiquidSwipeDemo': (context) => LiquidSwipeDemo(),
  '/FlipCardDemo': (context) => FlipCardDemo(),
  '/FlutterRatingBarDemo': (context) => FlutterRatingBarDemo(),
  '/FlutterCustomClippersDemo': (context) => FlutterCustomClippersDemo(),
  '/FlutterSpeedDialDemo': (context) => FlutterSpeedDialDemo(),
  '/AnimatedTextKitPage': (context) => AnimatedTextKitPage(),
  '/DragListPage': (context) => DragListPage(),
  '/SlidingUpPanelPage': (context) => SlidingUpPanelPage(),
  '/CurvedNavigationBarPage': (context) => CurvedNavigationBarPage(),
  '/PercentIndicatorPage': (context) => PercentIndicatorPage(),
  '/BotToastDemoPage': (context) => BotToastDemoPage(),
  '/SlidablePage': (context) => SlidablePage(),
  '/PhotoViewPage': (context) => PhotoViewPage(),
  '/LikeButtonAnimationPage': (context) => LikeButtonAnimationPage(),
  '/StaggeredAnimationsPage': (context) => StaggeredAnimationsPage(),
  '/StickyHeadersPage': (context) => StickyHeadersPage(),
  '/SliverAppBarPage': (context) => SliverAppBarPage(),
  '/DouyinMyPage': (context) => DouyinMyPage(),
  '/SharedPreferencesPage': (context) => SharedPreferencesPage(),
  '/CameraPage': (context) => CameraPage(),
  '/DouyinMainPage': (context) => DouyinMainPage(),
  '/ArgumentsLessPage': (context, {arguments}) =>
      ArgumentsLessPage(arguments: arguments), // 无状态组件的传第参数
  '/ArgumentsFulPage': (context, {arguments}) =>
      ArgumentsFulPage(arguments: arguments), // 有状态组件的传第参数
  '/ScreenPage': (context) => ScreenPage(),
  '/ButtonPage': (context) => ButtonPage(),
  '/CountdownTimePage': (context) => CountdownTimePage(),
  '/InputPasswordPage': (context) => InputPasswordPage(),
  '/VerifiCodePage': (context) => VerifiCodePage(),
  '/ReturnTopPage': (context) => ReturnTopPage(),
  '/CustomAppbarPage': (context) => CustomAppbarPage(),
  '/AppBarShowPage': (context) => AppBarShowPage(),
  '/DialogPage': (context) => DialogPage(),
  '/DateTimePage': (context) => DateTimePage(),
  //'/PickerDateTimePage': (context) => PickerDateTimePage(),
  '/SwipeDeletePage': (context) => SwipeDeletePage(),
  '/DragSortPage': (context) => DragSortPage(),
  '/EasyrefreshPage': (context) => EasyrefreshPage(),
  '/CustomRefreshPage': (context) => CustomRefreshPage(),
  '/FormTextFieldPage': (context) => FormTextFieldPage(),
  '/TextFormFieldPage': (context) => TextFormFieldPage(),
  '/WrapPage': (context) => WrapPage(),
  '/FlexPage': (context) => FlexPage(),
  '/DioAndHttpPage': (context) => DioAndHttpPage(),
  '/SwiperPage': (context) => SwiperPage(),
  '/GridViewBuilderPage': (context) => GridViewBuilderPage(),
  '/GridViewExtentPage': (context) => GridViewExtentPage(),
  '/GridViewCountPage': (context) => GridViewCountPage(),
  '/GridViewPage': (context) => GridViewPage(),
  '/ListViewSeparatedPage': (context) => ListViewSeparatedPage(),
  '/ListViewBuilderPage': (context) => ListViewBuilderPage(),
  '/ListViewPage': (context) => ListViewPage(),
  '/GestureDetectorPage': (context) => GestureDetectorPage(),
  '/LoginPage': (context) => LoginPage(),
  '/IosTimePackerPage': (context) => IosTimePackerPage(),
  '/BubblesPage': (context) => BubblesPage(),
  '/LoginButtonAnimationPage': (context) => LoginButtonAnimationPage(),
  '/BlendModesPage': (context) => BlendModesPage(),
  '/DashBoardPage': (context) => DashBoardPage(),
  '/BezierCurvePage': (context) => BezierCurvePage(),
  '/RadarChartPage': (context) => RadarChartPage(),
  '/DrawableStartTextPage': (context) => DrawableStartTextPage(),
  '/AnimationWidgetPage': (context) => AnimationWidgetPage(),
  '/MarqueeWidgetPage': (context) => MarqueeWidgetPage(),
  '/ScrollerMarqueeTextPage': (context) => ScrollerMarqueeTextPage(),
  '/PullAndPushPage': (context) => PullAndPushPage(),
  '/DragAbleGridViewPage': (context) => DragAbleGridViewPage(),
  '/AdsorptionViewPage': (context) => AdsorptionViewPage(),
  '/CutScreenPage': (context) => CutScreenPage(),
  '/WidgetToImageDemo': (context) => WidgetToImageDemo(),
  '/GalleryPage': (context) => GalleryPage(),
  '/CameraImagePickerPage': (context) => CameraImagePickerPage(),
  '/TopTabsPage': (context) => TopTabsPage(),
  '/DrawerPage': (context) => DrawerPage(),
  '/ViewPage': (context) => ViewPage(),
  '/ScreenutilPage': (context) => ScreenutilPage(),
  '/SliverDemoPage': (context) => SliverDemoPage(),
  '/PostShowPage': (context, {arguments}) => PostShowPage(arguments: arguments),
  '/FontPage': (context) => FontPage(), // 自定义字体
  '/IconsPage': (context) => IconsPage(), // 自定义阿里图标
  '/': (context) => BottomTabBars(index: 0), // tab底部导航
  //'/': (context) => TabBarCenterButton(), // tab底部导航中间部分突出一个半圆导航
};

//固定统一处理命名路由传递参数
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
