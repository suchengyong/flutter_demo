import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAE_SCROLL_OFFSET = 200;

class AppBarShowPage extends StatefulWidget {
  @override
  _AppBarShowState createState() => _AppBarShowState();
}

class _AppBarShowState extends State<AppBarShowPage> {
  List _imageUrl = [
    'https://wx1.sinaimg.cn/mw690/684e58a1gy1g56ma49gxtj22c02xvb2b.jpg',
    'https://wx2.sinaimg.cn/mw690/6a0576a9ly1g2d262s749j24s036okjs.jpg',
  ];
  double alphaAppBar = 0;

  @override
  void initState() {
    super.initState();
  }

  _onScroll(offset) {
    double alpha = offset / APPBAE_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      alphaAppBar = alpha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification) {
                  _onScroll(scrollNotification.metrics.pixels);
                }
                return false;
              },
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 260,
                    child: Swiper(
                      itemCount: _imageUrl.length,
                      autoplay: false,
                      itemBuilder: (BuildContext, int index) {
                        return Image.network(
                          _imageUrl[index],
                          fit: BoxFit.fill,
                        );
                      },
                      pagination: SwiperPagination(),
                    ),
                  ),
                  Container(
                    color: Colors.green,
                    height: 800,
                  )
                ],
              ),
            ),
          ),
          Opacity(
            opacity: alphaAppBar,
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      print("返回案妞出发");
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      alignment: Alignment(0.0, 0.5),
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  Container(
                    width: 320,
                    alignment: Alignment(0.0, 0.5),
                    child: Text('滚动渐变显示标题'),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
