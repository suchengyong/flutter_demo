import 'package:flutter/material.dart';

class ShowSheetDialog extends StatefulWidget {
  //按钮title
  List<String> items = [];
  //点击事件回调 0开始
  Function onTap;
  //标题 可选
  String title;

  ShowSheetDialog({
    @required this.items,
    this.onTap,
    this.title,
  });

  @override
  _ShowSheetDialogState createState() => _ShowSheetDialogState();
}

class _ShowSheetDialogState extends State<ShowSheetDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //有标题的情况下
          (widget.title != null && widget.title.length > 0)
              ? Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: Text(
                    widget.title,
                    style: TextStyle(color: Colors.black87, fontSize: 14),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Colors.grey[300], width: 1),
                    ),
                  ),
                )
              : Container(),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: widget.items.map((title) {
              int index = widget.items.indexOf(title);
              return GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  widget.onTap(index, title);
                },
                child: _itemCreat(title),
              );
            }).toList(),
          ),
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: _itemCreat('取消'),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  Widget _itemCreat(String title) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.black87),
          textAlign: TextAlign.center,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey[300], width: 1)),
      ),
    );
  }
}
