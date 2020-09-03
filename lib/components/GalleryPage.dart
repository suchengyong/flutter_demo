import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef OnPageChange(int index);

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  var _currentIndex = 0;
  PageController _pageController;
  final List<String> images = [
    'assets/images/chaonan1.jpeg',
    'assets/images/chaonan2.jpg',
    'assets/images/chaonan3.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    num screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('画廊效果'),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SizedBox(
          height: screenWidth * 0.8 / 4 * 3,
          child: PageView.builder(
              controller: _pageController,
              itemCount: images.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return PageChild(
                  index: index,
                  imgPath: images[index],
                  onPageChange: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  imgLength: images.length,
                  pageController: _pageController,
                );
              }),
        ));
  }

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: images.length % 2, viewportFraction: 0.8);
  }
}

class PageChild extends StatefulWidget {
  final int index;
  final String imgPath;
  final OnPageChange onPageChange;
  final PageController pageController;
  final int imgLength;

  PageChild({
    @required this.index,
    @required this.imgPath,
    @required this.onPageChange,
    @required this.pageController,
    @required this.imgLength,
  });

  @override
  State<StatefulWidget> createState() {
    return PageChildState();
  }
}

class PageChildState extends State<PageChild> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(widget.index);
        widget.pageController.animateToPage(widget.index % widget.imgLength,
            duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.asset(
            widget.imgPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
