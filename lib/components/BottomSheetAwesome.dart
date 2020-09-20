import 'package:flutter/material.dart';

class BottomSheetAwesome extends StatefulWidget {
  static final String path = "lib/src/pages/misc/bottomsheet.dart";
  @override
  _BottomSheetAwesomeState createState() => _BottomSheetAwesomeState();
}

class _BottomSheetAwesomeState extends State<BottomSheetAwesome> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController _pageController = PageController();
  int currentIndex = 0;
  Map<dynamic, dynamic> progress = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          actions: <Widget>[
            InkWell(
              onTap: showaAwesomeSheet,
              child: Container(
                alignment: Alignment.center,
                height: 10,
                margin: EdgeInsets.all(8.0),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  progress.length == null ? "0/100" : "${progress.length}/100 ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
          title: Text('很棒的底部弹出框'),
        ),
        body: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '在许多情况下可以使用此布局，一个很好的例子是测验应用程序。 应用栏上的按钮显示在底部，该页面包含页面中页面索引的列表，并通过使用页面本身中的选择按钮并再次单击来取消选择页面，从而在选择页面时更改颜色',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                RaisedButton(
                  color: progress.containsKey(progress[index])
                      ? Theme.of(context).primaryColor
                      : Colors.grey.shade800,
                  onPressed: () {
                    if (progress.containsKey(progress[index]))
                      setState(() {
                        progress.remove(progress[index]);
                      });
                    else
                      setState(() {
                        progress[index] = index;
                      });
                  },
                  child: Text(
                    progress.containsKey(progress[index])
                        ? 'Unselect Page ${currentIndex + 1}'
                        : 'Select Page ${currentIndex + 1}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                          child: Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                          ),
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            _pageController.animateToPage(
                                _pageController.page.ceil() - 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.easeInBack);
                            // .jumpToPage(_pageController.page.ceil() - 1);
                          },
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Page ${currentIndex + 1}',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 35),
                          ),
                        ),
                        RaisedButton(
                          child: Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                          ),
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            _pageController.animateToPage(
                                _pageController.page.ceil() + 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.easeIn);
                            // .jumpToPage(_pageController.page.ceil() + 1);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          itemCount: 100,
        ));
  }

  showaAwesomeSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    " Sheet",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Divider(height: 0),
                Expanded(
                  child: GridView.builder(
                    itemBuilder: (context, index) {
                      return getTile(index);
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8,
                    ),
                    itemCount: 100,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  getTile(key) {
    int index = key;
    bool hasVisited = progress[key] != null;
    return GestureDetector(
      onTap: () {
        setState(() {
          _pageController.jumpToPage(index);
          Navigator.pop(context);
        });
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              color: currentIndex == index
                  ? Theme.of(context).primaryColor
                  : Colors.black12),
          color: hasVisited ? Theme.of(context).primaryColor : Colors.white,
        ),
        child: Text(
          "${index + 1}",
          style: TextStyle(
            color: hasVisited ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
