import 'package:flutter/material.dart';

class FormTextFieldPage extends StatefulWidget {
  FormTextFieldPage({Key key}) : super(key: key);

  @override
  _FormTextFieldPageState createState() => _FormTextFieldPageState();
}

class _FormTextFieldPageState extends State<FormTextFieldPage> {
  // 添加监听点击空白处收起键盘
  final FocusNode focusNode = FocusNode();
  var _username = new TextEditingController(); //初始化给表单赋值
  var infoMsg = '';
  int sex = 0;

  List hobby = [
    {"checked": false, "title": "打球"},
    {"checked": false, "title": "写代码"},
    {"checked": true, "title": "读书"},
    {"checked": false, "title": "听音乐"}
  ];
  //爱好动态生成
  List<Widget> _getHobby() {
    List<Widget> tempList = [];
    for (var i = 0; i < this.hobby.length; i++) {
      tempList.add(Row(children: <Widget>[
        Text(this.hobby[i]['title'] + ':'),
        Checkbox(
            activeColor: Colors.red, //选中时候颜色
            value: this.hobby[i]['checked'], //是否选中
            onChanged: (value) {
              this.setState(() {
                this.hobby[i]['checked'] = value;
              });
            })
      ]));
    }
    return tempList;
  }

  @override
  void initState() {
    //初始化生命周期
    super.initState();
    _username.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('学员登记系统')),
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
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        hintText: '请输入用户名称', //默认提示类型html的placeholder
                        labelText: "用户名",
                        border: OutlineInputBorder() //添加边框
                        ),
                    controller: _username, //赋值初始值
                    onChanged: (value) {
                      //将改变的值赋值给它
                      _username.text = value;
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Text('性别：'),
                      Radio(
                          value: 1,
                          groupValue: this.sex,
                          onChanged: (v) {
                            this.setState(() {
                              this.sex = v;
                            });
                          }),
                      Text('男'),
                      Radio(
                          value: 2,
                          groupValue: this.sex,
                          onChanged: (v) {
                            this.setState(() {
                              this.sex = v;
                            });
                          }),
                      Text('女'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Wrap(children: this._getHobby()),
                  SizedBox(height: 10),
                  TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: '请输入备注消息', //默认提示类型html的placeholder
                        border: OutlineInputBorder() //添加边框
                        ),
                    onChanged: (value) {
                      //将改变的值赋值给它
                      this.setState(() {
                        this.infoMsg = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.all(20),
                          child: RaisedButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            elevation: 10,
                            child: Text('提交'),
                            onPressed: () {
                              print(this._username.text);
                              print(this.sex);
                              print(this.hobby);
                              print(this.infoMsg);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
