import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/Pulgs/CellInput.dart';

class InputPasswordPage extends StatefulWidget {
  InputPasswordPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _InputPasswordState createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPasswordPage> {
  String _groupValue = "密码";
  InputType _inputType = InputType.password;

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("验证码输入框"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          CellInput(
            key: UniqueKey(),
            autofocus: true,
            inputType: _inputType,
            solidColor: Color(0xFFF5F6FB),
            borderRadius: BorderRadius.circular(5),
            inputCompleteCallback: (v) {
              print(v);
              //输入完成隐藏键盘
              SystemChannels.textInput.invokeMethod('TextInput.hide');
            },
          ),
          RadioListTile<String>(
            value: '密码',
            title: Text('密码'),
            groupValue: _groupValue,
            onChanged: (v) {
              setState(() {
                _inputType = InputType.password;
                _groupValue = v;
              });
            },
          ),
          RadioListTile<String>(
            value: '数字',
            groupValue: _groupValue,
            title: Text('数字'),
            onChanged: (v) {
              setState(() {
                _inputType = InputType.number;
                _groupValue = v;
              });
            },
          ),
          RadioListTile<String>(
            value: '文本',
            groupValue: _groupValue,
            title: Text('文本'),
            onChanged: (v) {
              setState(() {
                _inputType = InputType.text;
                _groupValue = v;
              });
            },
          ),
        ],
      ),
    );
  }
}
