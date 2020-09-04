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

//配置路由
final routes = {
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
  '/': (context) => BottomTabBars(index: 3), // tab底部导航
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
