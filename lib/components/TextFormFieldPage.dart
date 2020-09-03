import 'package:flutter/material.dart';

class TextFormFieldPage extends StatelessWidget {
  // 添加监听点击空白处收起键盘
  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 是否调整主体的大小以避免键盘遮挡部分布局 不设置可以整体添加滚动条 body：Scrollbar(child:SingleChildScrollView(child: 布局内容))
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('表单'),
        elevation: 0.0,
      ),
      body: Theme(
        // 页面自定义主题
        // 覆盖主题 只覆盖对于属性的主题，如primaryColor 修改为Colors.red
        data: Theme.of(context).copyWith(
          primaryColor: Colors.orange,
        ),
        child: GestureDetector(
          // 添加监听点击空白处收起键盘
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus.unfocus();
            }
          },
          child: Container(
            // 这个页面添加颜色才能起点击空白处收起键盘，估计Container没有占满全屏导致的
            color: Colors.transparent,
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[TextFieldDemo(), RegisterForm()],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password;
  bool autovalidate = false;

  void submitRegisterForm() {
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();

      debugPrint('username: $username');
      debugPrint('password: $password');
      // 底部弹出一个通知弹空
      Scaffold.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('注册成功...'),
        ),
      );
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  String validateUsername(value) {
    if (value.isEmpty) {
      return '用户名不能为空.';
    }

    return null;
  }

  String validatePassword(value) {
    if (value.isEmpty) {
      return '密码不能为空.';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: '用户名',
              helperText: '',
            ),
            onSaved: (value) {
              username = value;
            },
            validator: validateUsername,
            autovalidate: autovalidate,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: '密码',
              helperText: '',
            ),
            onSaved: (value) {
              password = value;
            },
            validator: validatePassword,
            autovalidate: autovalidate,
          ),
          SizedBox(
            height: 32.0,
          ),
          Container(
            width: double.infinity,
            height: 40,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('注册', style: TextStyle(color: Colors.white)),
              elevation: 0.0,
              onPressed: submitRegisterForm,
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  TextFieldDemoState createState() => TextFieldDemoState();
}

class TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // 初始化输入框的值
    // textEditingController.text = 'hi';
    textEditingController.addListener(() {
      debugPrint('input: ${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onChanged: (value) {
        debugPrint('input: $value');
      },
      onSubmitted: (value) {
        debugPrint('submit: $value');
      },
      decoration: InputDecoration(
        icon: Icon(Icons.people),
        labelText: '标题',
        hintText: '请输入文本.',
        // border: InputBorder.none,
        // border: OutlineInputBorder(),
        filled: true,
      ),
    );
  }
}
