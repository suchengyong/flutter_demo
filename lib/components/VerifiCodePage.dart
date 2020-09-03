import 'package:flutter/material.dart';
import 'package:flutter_demo/Pulgs/verification_box/verification_index.dart';

class VerifiCodePage extends StatefulWidget {
  VerifiCodePage({Key key}) : super(key: key);

  @override
  _VerificationCodeState createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerifiCodePage> {
  // 添加监听点击空白处收起键盘
  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('验证码输入框标题')),
      body: GestureDetector(
        // 添加监听点击空白处收起键盘
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus.unfocus();
          }
        },
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              height: 45,
              child: VerificationBox(
                showCursor: true,
                cursorWidth: 2,
                cursorColor: Colors.red,
                cursorIndent: 10,
                cursorEndIndent: 10,
                focusBorderColor: Colors.lightBlue,
                unfocus: false,
                onSubmitted: (value) {
                  print('$value');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
