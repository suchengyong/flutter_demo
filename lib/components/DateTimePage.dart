import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class DateTimePage extends StatefulWidget {
  DateTimePage({Key key}) : super(key: key);

  @override
  _DateTimePageState createState() => _DateTimePageState();
}

class _DateTimePageState extends State<DateTimePage> {
  //初始日期
  DateTime _nowDate = DateTime.now();
  var date = '2020年05月29';
  //显示日期
  _showDatePicker() {
    showDatePicker(
      context: context,
      fieldHintText: '请输入例如2020/5/29',
      fieldLabelText: '输入日期',
      helpText: '选择日期',
      initialDate: _nowDate, //开始日期
      firstDate: DateTime(1980), //起始日期
      lastDate: DateTime(2080), //结束日期
    ).then((result) {
      print('选中日期是：$result');
      _nowDate = result;
      if (result != null) {
        this.setState(() {
          this.date = formatDate(result, [yyyy, '年', mm, '月', dd]);
        });
      }
    });
  }

  //初始时间
  var _nowtime = TimeOfDay(hour: 12, minute: 30);
  _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: _nowtime, //开始日期
    ).then((result) {
      print('选中时间是：$result');
      if (result != null) {
        this.setState(() {
          this._nowtime = result;
        });
      }
    });
  }

  @override
  void initState() {
    //初始化生命周期
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('日期展示标题')),
      body: Column(children: <Widget>[
        SizedBox(height: 50),
        //日期选择
        InkWell(
          // 该组件没有任何效果
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[Text(this.date), Icon(Icons.arrow_drop_down)]),
          onTap: () {
            print("打开日期组件");
            this._showDatePicker();
          },
        ),
        SizedBox(height: 20),
        //时间选择
        InkWell(
          // 该组件没有任何效果
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(this._nowtime.format(context)),
                Icon(Icons.arrow_drop_down)
              ]),
          onTap: () {
            print("打开日期组件");
            this._showTimePicker();
          },
        )
      ]),
    );
  }
}
