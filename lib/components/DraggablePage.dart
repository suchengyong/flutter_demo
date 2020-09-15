import 'package:flutter/material.dart';
import 'package:flutter_demo/components/DraggableWidgetPage.dart';

class DraggablePage extends StatefulWidget {
  @override
  _DraggableDemoState createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggablePage> {
  Color _draggableColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('可拖动组件draggable'),
        elevation: 0.0, //阴影大小
      ),
      body: Stack(
        children: <Widget>[
          DraggableWidgetPage(
            offset: Offset(100.0, 100.0),
            widgetColor: Colors.tealAccent,
          ),
          DraggableWidgetPage(
            offset: Offset(200.0, 100.0),
            widgetColor: Colors.redAccent,
          ),
          Center(
            child: DragTarget(onAccept: (Color color) {
              _draggableColor = color;
            }, builder: (context, candidateData, rejectedData) {
              return Container(
                width: 200.0,
                height: 200.0,
                color: _draggableColor,
              );
            }),
          )
        ],
      ),
    );
  }
}
