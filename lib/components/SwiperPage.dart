import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

List<Map> imgList = [
  {'imgUrl': 'https://www.itying.com/images/flutter/1.png'},
  {'imgUrl': 'https://www.itying.com/images/flutter/2.png'},
  {'imgUrl': 'https://www.itying.com/images/flutter/3.png'},
  {'imgUrl': 'https://www.itying.com/images/flutter/4.png'},
  {'imgUrl': 'https://www.itying.com/images/flutter/5.png'}
];

class SwiperPage extends StatefulWidget {
  SwiperPage({Key key}) : super(key: key);

  @override
  _SwiperPageState createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('轮播图组件')),
      body: ListView(
        children: <Widget>[
          SwiperDemo2(),
          SizedBox(height: 20),
          SwiperDemo3D(),
          SizedBox(height: 20),
          SwiperDemo4(),
          SizedBox(height: 20),
          SwiperDemo5(),
          SizedBox(height: 20),
          SwiperDemo6(),
        ],
      ),
    );
  }
}

// 默认效果2
class SwiperDemo2 extends StatelessWidget {
  const SwiperDemo2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //宽度等于最外层的宽度
      child: AspectRatio(
        //配置宽度高度16比9关系，再样轮播图图片就不变形了
        aspectRatio: 16 / 9, //可以适配各种屏幕
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              imgList[index]['imgUrl'],
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
    );
  }
}

// 3D效果
class SwiperDemo3D extends StatelessWidget {
  const SwiperDemo3D({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            imgList[index]['imgUrl'],
            fit: BoxFit.cover,
          );
        },
        itemCount: imgList.length,
        viewportFraction: 0.8,
        scale: 0.9,
      ),
    );
  }
}

// 无限卡片堆叠
class SwiperDemo4 extends StatelessWidget {
  const SwiperDemo4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            imgList[index]['imgUrl'],
            fit: BoxFit.cover,
          );
        },
        itemCount: imgList.length,
        itemWidth: 300.0,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}

//无限卡片堆叠2
class SwiperDemo5 extends StatelessWidget {
  const SwiperDemo5({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            imgList[index]['imgUrl'],
            fit: BoxFit.cover,
          );
        },
        itemCount: imgList.length,
        itemWidth: 300.0,
        itemHeight: 300.0,
        layout: SwiperLayout.TINDER,
      ),
    );
  }
}

// 自定义效果
class SwiperDemo6 extends StatelessWidget {
  const SwiperDemo6({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: new Swiper(
        layout: SwiperLayout.CUSTOM,
        customLayoutOption:
            new CustomLayoutOption(startIndex: -1, stateCount: 3)
                .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
          new Offset(-370.0, -40.0),
          new Offset(0.0, 0.0),
          new Offset(370.0, -40.0)
        ]),
        itemWidth: 300.0,
        itemHeight: 200.0,
        itemBuilder: (context, index) {
          return new Image.network(
            imgList[index]['imgUrl'],
            fit: BoxFit.cover,
          );
        },
        itemCount: imgList.length,
      ),
    );
  }
}
