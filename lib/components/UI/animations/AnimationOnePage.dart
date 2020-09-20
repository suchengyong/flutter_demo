import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../data/assets.dart' as assets;
import '../widgets/network_image.dart';

List<String> images = [
  assets.images[0],
  assets.images[1],
  assets.images[2],
  assets.images[3],
];

const List<Map> dummy = [
  {"title": "Beautiful Cardigan", "price": "\$600"},
  {"title": "Leather Bag", "price": "\$400"},
  {"title": "White Beautiful Bag", "price": "\$350"},
  {"title": "White Beautiful griy", "price": "\$850"},
];

class AnimationOnePage extends StatefulWidget {
  @override
  _AnimationOnePageState createState() => _AnimationOnePageState();
}

class _AnimationOnePageState extends State<AnimationOnePage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  int prevIndex = 0;
  final SwiperController _swiperController = SwiperController();
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(
                  Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
                text: "Best items",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: " from around"),
          ])),
          Expanded(
            flex: 2,
            child: Swiper(
              physics: BouncingScrollPhysics(),
              viewportFraction: 0.8,
              itemCount: 4,
              loop: false,
              controller: _swiperController,
              onIndexChanged: (index) {
                _controller.reverse();
                setState(() {
                  prevIndex = currentIndex;
                  currentIndex = index;
                  _controller.forward();
                });
              },
              itemBuilder: (context, index) {
                print(images[index]);
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            PageRouteBuilder(
                                transitionDuration: Duration(seconds: 1),
                                pageBuilder: (_, __, ___) =>
                                    AnimationOneDetails(
                                      index: index,
                                    ))),
                        child: Hero(
                          tag: "image$index",
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: PNetworkImage(
                              images[index],
                              fit: BoxFit.cover,
                              width: 300,
                              height: 300,
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                );
              },
            ),
          ),
          Stack(
            children: <Widget>[
              AnimatedOpacity(
                opacity: currentIndex == 0 ? 1 : 0,
                child: _buildDesc(0),
                duration: Duration(seconds: 1),
              ),
              AnimatedOpacity(
                opacity: currentIndex == 1 ? 1 : 0,
                child: _buildDesc(1),
                duration: Duration(seconds: 1),
              ),
              AnimatedOpacity(
                opacity: currentIndex == 2 ? 1 : 0,
                child: _buildDesc(2),
                duration: Duration(seconds: 1),
              ),
              AnimatedOpacity(
                opacity: currentIndex == 3 ? 1 : 0,
                child: _buildDesc(3),
                duration: Duration(seconds: 1),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDesc(int index) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 10.0),
          Hero(
            tag: "title$index",
            child: Material(
              type: MaterialType.transparency,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  dummy[index]["title"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Hero(
            tag: "price$index",
            child: Material(
              type: MaterialType.transparency,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  dummy[index]["price"],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

///
class AnimationOneDetails extends StatelessWidget {
  final int index;

  const AnimationOneDetails({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: "image$index",
            child: PNetworkImage(
              images[index],
              fit: BoxFit.cover,
              width: 300,
              height: 300,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20.0),
                IconButton(
                  color: Colors.white,
                  icon: Icon(
                      Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                Spacer(),
                SizedBox(height: 10.0),
                Hero(
                  tag: "title$index",
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      dummy[index]["title"],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Hero(
                  tag: "price$index",
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      dummy[index]['price'],
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          )
        ],
      ),
    );
  }
}
