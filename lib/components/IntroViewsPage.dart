import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:flutter/material.dart';
import 'ReturnHome.dart';

class IntroViewsPage extends StatelessWidget {
  //making list of pages needed to pass in IntroViewsFlutter constructor.
  final pages = [
    new PageViewModel(
        pageColor: const Color(0xFF03A9F4),
        //iconImageAssetPath: 'assets/air-hostess.png',
        //bubble: Image.asset('assets/images/chaonan1.jpeg'),
        iconColor: Color(0xFFFFFFFF),
        bubbleBackgroundColor: Color(0xFFFFFFFF),
        body: Text(
          '预订机票，取消后可全额退款',
        ),
        title: Text(
          '航班',
        ),
        textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        mainImage: Image.asset(
          'assets/images/chaonan1.jpeg',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        )),
    new PageViewModel(
      pageColor: const Color(0xFF8BC34A),
      //iconImageAssetPath: 'assets/waiter.png',
      // bubble: Image.asset('assets/images/chaonan2.jpg'),
      iconColor: Color(0xFFFFFFFF),
      bubbleBackgroundColor: Color(0xFFFFFFFF),
      body: Text(
        '我们致力于舒适，在美丽的酒店享受您的住宿',
      ),
      title: Text('酒店'),
      mainImage: Image.asset(
        'assets/images/chaonan2.jpg',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    new PageViewModel(
      pageColor: const Color(0xFF607D8B),
      //iconImageAssetPath: 'assets/taxi-driver.png',
      //bubble: Image.asset('assets/images/chaonan3.jpeg'),
      iconColor: Color(0xFFFFFFFF),
      bubbleBackgroundColor: Color(0xFFFFFFFF),
      body: Text(
        '无现金支付系统，方便在您家门口预订出租车',
      ),
      title: Text('出租车'),
      mainImage: Image.asset(
        'assets/images/chaonan3.jpeg',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //ThemeData
      body: new Builder(
        builder: (context) => new IntroViewsFlutter(
          pages,
          onTapDoneButton: () {
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => new ReturnHome(),
              ), //MaterialPageRoute
            );
          },
          showSkipButton: true,
          showNextButton: true,
          showBackButton: true,
          doneText: Text('完成'),
          skipText: Text('跳过'),
          nextText: Text('下一步'),
          backText: Text('上一步'),
          pageButtonTextStyles: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ), //IntroViewsFlutter
      ), //Builder
    ); //Material App
  }
}
