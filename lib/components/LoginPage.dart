import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'LoginComponents.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 定义两个输入框controller
  TextEditingController _phoneNum = TextEditingController();
  TextEditingController _password = TextEditingController();
  // 密码框是否显示原文
  bool _passwordIsShow = true;
  // 定义选中协议
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('登录页面'),
      // ),
      // 是否调整主体的大小以避免键盘遮挡部分布局 不设置可以整体添加滚动条 body：Scrollbar(child:SingleChildScrollView(child: 布局内容))
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          // 背景圆弧形
          CurveBgWidget(color: const Color(0xffdddddd)),
          // 表单内容
          Container(
            height: 500,
            margin: EdgeInsets.only(top: 230, left: 16, right: 16),
            padding: const EdgeInsets.only(top: 100, left: 16, right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  // 验证规则
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11), // 限制只能输入11位
                    WhitelistingTextInputFormatter(RegExp("[0-9]")) // 限制只能输入的字符
                  ],
                  controller: _phoneNum,
                  maxLines: 1,
                  //maxLength: 30,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone_iphone),
                    hintText: '请输入手机号',
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  onChanged: (value) {
                    //将改变的值赋值给它
                    setState(() {
                      _phoneNum.text = value;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    // 验证规则
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(18), // 限制只能输入11位
                      WhitelistingTextInputFormatter(
                        RegExp("[a-zA-Z0-9]"),
                      ) // 限制只能输入的字符
                    ],
                    controller: _password,
                    maxLines: 1,
                    //maxLength: 32,
                    obscureText: _passwordIsShow,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      hintText: '请输入登录密码',
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _passwordIsShow = !_passwordIsShow;
                          });
                        },
                        child: Icon(Icons.remove_red_eye),
                      ),
                    ),
                    onChanged: (value) {
                      //将改变的值赋值给它
                      setState(() {
                        _password.text = value;
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        print('点击---忘记密码');
                      },
                      child: Text(
                        '忘记密码？',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff333333)),
                      ),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    print('手机号:' + this._phoneNum.text);
                    print('密码:' + this._password.text);
                    print('协议是否同意:$_isChecked');
                    print(this._isChecked);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 12),
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFFEA3D87),
                            const Color(0xFFFF7095)
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(1.0, 5.0),
                            color: Color.fromRGBO(234, 61, 135, 0.4),
                            blurRadius: 5.0,
                          )
                        ]),
                    child: Text(
                      '登录',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            print('点击---验证码登录');
                          },
                          child: Text(
                            '验证码登录',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xff333333)),
                          ),
                        ),
                        Container(
                          height: 12,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: VerticalDivider(
                            width: 0.0,
                            color: Color(0xFF333333),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print('点击---新用户注册');
                          },
                          child: Text(
                            '新用户注册',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF02A9FF),
                            ),
                          ),
                        )
                      ]),
                ),
                SizedBox(height: 20),
                // 列一种方法实现协议
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      activeColor: Colors.pink,
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value;
                        });
                      },
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: '我已阅读并同意遵守',
                          style: TextStyle(color: Color(0xFF666666)),
                          children: <TextSpan>[
                            TextSpan(
                              text: '《***用户协议》',
                              style: TextStyle(color: Colors.pink),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('点击了***用户协议');
                                },
                            ),
                            TextSpan(
                              text: ' 和 ',
                              style: TextStyle(color: Color(0xFF666666)),
                            ),
                            TextSpan(
                              text: '《隐私政策》',
                              style: TextStyle(color: Colors.pink),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('点击了隐私政策');
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // 列一种方法实现协议
                Opacity(
                  opacity: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                        activeColor: Colors.pink,
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value;
                          });
                        },
                      ),
                      Expanded(
                        child: Text.rich(TextSpan(
                          text: '我已阅读并同意遵守',
                          style: TextStyle(color: Color(0xFF666666)),
                          children: [
                            TextSpan(
                              text: '《隐私政策》',
                              style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('点击了隐私政策');
                                },
                            ),
                          ],
                        )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          // 白色圆形
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(top: 200),
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
          ),
          // 红色圆形
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 210),
            child: Column(
              children: <Widget>[
                Container(
                  width: 80,
                  height: 80,
                  decoration:
                      BoxDecoration(color: Colors.pink, shape: BoxShape.circle),
                ),
                Text(
                  '登录',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF666666),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
