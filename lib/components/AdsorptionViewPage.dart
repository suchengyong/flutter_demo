import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AdsorptionViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    List<AdsorptionListBin> adsorptionDatas = new List();
    AdsorptionListBin adsorptionData;

    adsorptionData = new AdsorptionListBin("A");
    adsorptionData.isHeader = true;
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("阿杜");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("阿宝");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("艾夫杰尼");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("阿牛");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("安苏羽");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("阿勒长青");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("B");
    adsorptionData.isHeader = true;
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("白小白");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("白羽毛");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("Bridge");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("斑马");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("白一阳");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("白举纲");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("暴林");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("C");
    adsorptionData.isHeader = true;
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("陈奕迅");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("陈小春");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("成龙");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("陈百强");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("迟志强");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("崔健");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("陈晓东");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("陈学冬");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("蔡国庆");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("陈冠希");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("陈琳");
    adsorptionDatas.add(adsorptionData);
    adsorptionData = new AdsorptionListBin("崔健");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("陈晓东");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("陈学冬");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("蔡国庆");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("陈冠希");
    adsorptionDatas.add(adsorptionData);

    adsorptionData = new AdsorptionListBin("陈琳");
    adsorptionDatas.add(adsorptionData);
    return new AdsorptionViewState(adsorptionDatas);
  }
}

///此控件适用于固定高度的ListView
class AdsorptionViewState extends State<AdsorptionViewPage> {
  AdsorptionViewState(this.adsorptionDatas);

  List<AdsorptionListBin> adsorptionDatas;
  double itemHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("吸附布局"),
      ),
      body: new AdsorptionView(
        adsorptionDatas: adsorptionDatas,
        generalItemChild: (AdsorptionListBin bin) {
          print("build Item Child ${bin.headerName}");
          return new Container(
            height: 60,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
            child: new Text(
              bin.headerName,
              style: new TextStyle(fontSize: 18.0, color: Colors.grey),
            ),
          );
        },
        headChild: (AdsorptionListBin bin) {
          print("build head Child");
          return new Container(
            height: 50,
            color: Colors.red,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
            child: new Text(
              bin.headerName,
              style: new TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}

//下面是组件部分上面是如何使用
//adsorptionview组件部分
typedef Widget GetHearWidget<M extends AdsorptionData>(M bin);
typedef Widget GetGeneralItem<M extends AdsorptionData>(M bin);

class AdsorptionView<T extends AdsorptionData> extends StatefulWidget {
  final List<T> adsorptionDatas;
  final GetHearWidget<T> headChild;
  final GetGeneralItem<T> generalItemChild;
  final double itemHeight;
  final double itemWidth;
  final double cacheExtent;
  //final bool isEqualHeightItem;

  AdsorptionView({
    @required this.adsorptionDatas,
    @required this.headChild,
    @required this.generalItemChild,
    this.itemHeight: 50.0,
    this.itemWidth: double.infinity,
    this.cacheExtent: 30.0,
    //@required this.isEqualHeightItem,
  }) : assert(
          adsorptionDatas != null,
          generalItemChild != null && headChild != null,
        );

  @override
  State<StatefulWidget> createState() {
//    if(isEqualHeightItem) {
    return new AdsorptionViewStateDemo<T>();
//    }else{
//      return new AdsorptionViewNotEqualHeightState<T>();
//    }
  }
}

// equalHeightState组件部分

///此控件适用于固定高度的ListView
class AdsorptionViewStateDemo<T extends AdsorptionData>
    extends State<AdsorptionView<T>> {
  ScrollController scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new AdsorptionListView(
          scrollController: scrollController,
          adsorptionDatas: widget.adsorptionDatas,
          generalItemChild: widget.generalItemChild,
          headChild: widget.headChild,
          itemHeight: widget.itemHeight,
          itemWidth: widget.itemWidth,
          cacheExtent: widget.cacheExtent,
        ),
        new GestureDetector(
          onTap: () {
            double pixels = scrollController.position.pixels;
            int a = pixels ~/ widget.itemHeight;
            for (int i = a; i >= 0; i--) {
              if (widget.adsorptionDatas[i].isHeader) {
                scrollController.animateTo(i * widget.itemHeight,
                    duration: new Duration(milliseconds: 200),
                    curve: Curves.linear);
                break;
              }
            }
          },
          child: new HeaderView(
            scrollController: scrollController,
            headChild: widget.headChild,
            adsorptionDatas: widget.adsorptionDatas,
            itemWidth: widget.itemWidth,
            itemHeight: widget.itemHeight,
          ),
        ),
      ],
    );
  }
}

class AdsorptionListView<T extends AdsorptionData> extends StatefulWidget {
  final ScrollController scrollController;
  final double itemHeight;
  final double itemWidth;
  final double cacheExtent;
  final List<T> adsorptionDatas;
  final GetHearWidget<T> headChild;
  final GetGeneralItem<T> generalItemChild;

  AdsorptionListView({
    @required this.adsorptionDatas,
    @required this.headChild,
    @required this.generalItemChild,
    this.itemHeight: 50.0,
    this.itemWidth: double.infinity,
    this.cacheExtent: 30.0,
    @required this.scrollController,
  }) : assert(
          adsorptionDatas != null,
          generalItemChild != null && headChild != null,
        );

  @override
  State<StatefulWidget> createState() {
    return AdsorptionListViewState<T>();
  }
}

class AdsorptionListViewState<T extends AdsorptionData>
    extends State<AdsorptionListView<T>> {
  ScrollPhysics scrollPhysics = new ClampingScrollPhysics();

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      physics: scrollPhysics,
      cacheExtent: widget.cacheExtent,
      controller: widget.scrollController,
      itemCount: widget.adsorptionDatas.length,
      itemBuilder: (context, index) {
        if (widget.adsorptionDatas[index].isHeader) {
          return new Container(
            width: widget.itemWidth,
            height: widget.itemHeight,
            child: widget.headChild(widget.adsorptionDatas[index]),
          );
        } else {
          return new Container(
            width: widget.itemWidth,
            height: widget.itemHeight,
            child: widget.generalItemChild(widget.adsorptionDatas[index]),
          );
        }
      },
    );
  }
}

class HeaderView<T extends AdsorptionData> extends StatefulWidget {
  final ScrollController scrollController;
  final double itemHeight;
  final double itemWidth;
  final GetHearWidget<T> headChild;
  final List<T> adsorptionDatas;

  HeaderView({
    @required this.scrollController,
    this.itemHeight: 50.0,
    this.itemWidth: double.infinity,
    @required this.headChild,
    @required this.adsorptionDatas,
  });

  @override
  State<StatefulWidget> createState() {
    return new HeaderViewState<T>();
  }
}

class HeaderViewState<T extends AdsorptionData> extends State<HeaderView<T>> {
  double headerOffset = 0.0;
  T headerStr;
  double beforeScroll = 0.0;

  @override
  void initState() {
    headerStr = widget.adsorptionDatas.first;

    widget.scrollController.addListener(() {
      //计算滑动了多少距离了
      double pixels = widget.scrollController.position.pixels;

      //根据滑动的距离 计算当前可见的第一个Item的Position
      int a = pixels ~/ widget.itemHeight;
      //计算滑动出屏幕多少距离
      double b = pixels % widget.itemHeight;
      double currentScrollPosition =
          widget.scrollController.position.extentBefore;
      //如果下一个item是Header 则偏移 如果不是 则偏移量=0
      if (widget.adsorptionDatas[a + 1].isHeader) {
        setState(() {
          // 改变布局
          if (currentScrollPosition - beforeScroll < 0) {
            //检测到再向上划就越出当前组 提前改变header的内容并偏移
            for (int i = a; i >= 0; i--) {
              if (widget.adsorptionDatas[i].isHeader) {
                headerStr = widget.adsorptionDatas[i];
                break;
              }
            }
          }
          beforeScroll = currentScrollPosition;
          headerOffset = -b;
        });
      } else {
        //始终使header处于完整显示状态
        for (int i = a; i >= 0; i--) {
          if (widget.adsorptionDatas[i].isHeader) {
            if (headerStr != widget.adsorptionDatas[i]) {
              setState(() {
                headerStr = widget.adsorptionDatas[i];
              });
            }
            break;
          }
        }
        if (headerOffset != 0) {
          setState(() {
            headerOffset = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      transform: Matrix4.translationValues(0.0, headerOffset, 0.0),
      width: widget.itemWidth,
      height: widget.itemHeight,
      child: widget.headChild(headerStr),
    );
  }
}

// ///此控件适用于非固定高度的ListView
// class AdsorptionViewNotEqualHeightState<T extends AdsorptionData>
//     extends State<AdsorptionView<T>>
//     implements PositionChangedListener, ViewChangeListener {
//   ScrollController scrollController = new ScrollController();
//   GlobalKey listViewKey = new GlobalKey();
//   double lastTimePix = 0.0;
//   int memoryPosition = 0;

//   void saveHeaderPosition(int k, double listViewGlobalPositionY) {
//     if (widget.adsorptionDatas[k].headerPosition < 0) {
//       var context = widget.adsorptionDatas[k].adsorptionKey.currentContext;
//       if (context != null) {
//         RenderBox renderBox = context.findRenderObject();
//         var offsetScreen = renderBox.getTransformTo(null).getTranslation().y;
//         widget.adsorptionDatas[k].headerPosition =
//             scrollController.position.pixels +
//                 offsetScreen -
//                 listViewGlobalPositionY;
//         print(
//             "${widget.adsorptionDatas[k]}********${widget.adsorptionDatas[k].headerPosition}");
//       }
//     }
//   }
// }

class AdsorptionListBin extends AdsorptionData {
  AdsorptionListBin(this.headerName);

  String headerName;

  @override
  String toString() {
    return 'AdsorptionListBin{headerName: $headerName}';
  }
}

class AdsorptionData {
  bool isHeader = false;
  GlobalKey adsorptionKey = new GlobalKey();
  double headerPosition = -99.0;
}
