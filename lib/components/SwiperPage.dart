import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperPage extends StatefulWidget {
  SwiperPage({Key key}) : super(key: key);

  @override
  _SwiperPageState createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {
  List<Map> imgList = [
    {'imgUrl': 'https://www.itying.com/images/flutter/1.png'},
    {'imgUrl': 'https://www.itying.com/images/flutter/2.png'},
    {'imgUrl': 'https://www.itying.com/images/flutter/3.png'},
    {'imgUrl': 'https://www.itying.com/images/flutter/4.png'},
    {'imgUrl': 'https://www.itying.com/images/flutter/5.png'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('轮播图组件')),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity, //宽度等于最外层的宽度
            child: AspectRatio(
              //配置宽度高度16比9关系，再样轮播图图片就不变形了
              aspectRatio: 16 / 9, //可以适配各种屏幕
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    this.imgList[index]['imgUrl'],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: imgList.length,
                pagination: SwiperPagination(), //控制指示点
                //loop: true,//无限循环轮播
                autoplay: true, //自动轮播
                duration: 500, //动画时间，单位是毫秒
                //control: SwiperControl(),//控制左右箭头
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SwiperDemo extends StatelessWidget {
  List<Map> imgList = [
    {'imgUrl': 'https://www.itying.com/images/flutter/1.png'},
    {'imgUrl': 'https://www.itying.com/images/flutter/2.png'},
    {'imgUrl': 'https://www.itying.com/images/flutter/3.png'},
    {'imgUrl': 'https://www.itying.com/images/flutter/4.png'},
    {'imgUrl': 'https://www.itying.com/images/flutter/5.png'}
  ];
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          this.imgList[index]['imgUrl'],
          fit: BoxFit.fill,
        );
      },
      itemCount: imgList.length,
      //pagination: SwiperPagination(),//控制指示点
      //control: SwiperControl(),//控制左右箭头
    );
  }
}
