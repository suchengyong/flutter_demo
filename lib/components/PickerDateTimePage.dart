import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class PickerDateTimePage extends StatefulWidget {
  PickerDateTimePage({Key key}) : super(key: key);

  @override
  _PickerDateTimeState createState() => _PickerDateTimeState();
}

class _PickerDateTimeState extends State<PickerDateTimePage> {
  //日期选择
  //初始化日期
  DateTime _dateTime = DateTime.now();
  _showDatePicker() {
    DatePicker.showDatePicker(
      context,
      onMonthChangeStartWithFirstDate: true,
      pickerTheme: DateTimePickerTheme(
        showTitle: true,
        confirm: Text('确定', style: TextStyle(color: Colors.red)),
        cancel: Text('取消', style: TextStyle(color: Colors.grey)),
      ),
      minDateTime: DateTime.parse('1980-01-01'), //起始日期
      maxDateTime: DateTime.parse('2100-12-28'), //终止日期
      initialDateTime: _dateTime, //当前日期
      //在里只是展示年月日
      dateFormat: 'yyyy-MMMM-dd', //显示日期格式
      //下面两行打开显示年月日 时分
      //dateFormat:'yyyy年M月d日   EEE,H时:m分',
      //pickerMode:DateTimePickerMode.datetime,

      locale: DateTimePickerLocale.zh_cn, //配置语言，中文日期
      onClose: () => print("关闭事件"),
      onCancel: () => print('取消事件'),
      onChange: (result, List<int> index) {
        print('日期改变事件：$result');
      },
      onConfirm: (result, List<int> index) {
        print('日期确定按钮事件：$result');
        setState(() {
          _dateTime = result;
        });
      },
    );
  }

  //时间选择
  //初始化时间
  DateTime _time = DateTime.now();
  _showTimePicker() {
    DatePicker.showDatePicker(
      context,
      onMonthChangeStartWithFirstDate: true,
      pickerTheme: DateTimePickerTheme(
        showTitle: true,
        confirm: Text('确定', style: TextStyle(color: Colors.red)),
        cancel: Text('取消', style: TextStyle(color: Colors.grey)),
      ),
      minDateTime: DateTime.parse('1980-01-01 00:00:00'), //起始时间
      maxDateTime: DateTime.parse('2100-12-28 23:59:59'), //终止时间
      initialDateTime: _time, //当前日期
      dateFormat: 'HH:mm:ss', //'HH时:mm分:s秒',
      pickerMode: DateTimePickerMode.time, // show TimePicker
      locale: DateTimePickerLocale.zh_cn, //配置语言，中文日期
      onClose: () => print("关闭事件"),
      onCancel: () => print('取消事件'),
      onChange: (result, List<int> index) {
        print('时间改变事件：$result');
      },
      onConfirm: (result, List<int> index) {
        print('时间确定按钮事件：$result');
        setState(() {
          _time = result;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('第三方picker日期展示标题')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //日期选择
          InkWell(
            // 该组件没有任何效果
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    formatDate(this._dateTime, [yyyy, '-', mm, '-', dd]),
                  ), //格式化日期
                  Icon(Icons.arrow_drop_down)
                ]),
            onTap: () {
              print("打开日期组件");
              this._showDatePicker();
            },
          ),
          //时间选择
          InkWell(
            // 该组件没有任何效果
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    formatDate(this._time, [HH, ':', nn, ':', ss]),
                  ), //格式化时间
                  Icon(Icons.arrow_drop_down)
                ]),
            onTap: () {
              print("打开时间组件");
              this._showTimePicker();
            },
          )
        ],
      ),
    );
  }
}
