import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Dailog/CustomDialog.dart';
import 'Dailog/Loading.dart';
import 'Dailog/ShowAlertDialog.dart';
import 'Dailog/ShowCupertinoDialog.dart';
import 'Dailog/ShowModalBottomSheet.dart';

class DialogPage extends StatefulWidget {
  DialogPage({Key key}) : super(key: key);

  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  void printSelectValue(String val) {
    print(val);
  }

  var _dropValue;

  //alert 弹出框组件 基本写法
  // _alertDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (context){
  //       return AlertDialog(
  //         title: Text('提示信息标题'),
  //         content: Text('你确定要删除吗？'),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: Text("取消"),
  //             onPressed: (){
  //               Navigator.pop(context);
  //               print('取消');
  //             },
  //           ),
  //           FlatButton(
  //             child: Text("确定"),
  //             onPressed: (){
  //               Navigator.pop(context);
  //               print('确定');
  //             },
  //           )
  //         ],
  //       );
  //     }
  //   );
  // }
  //alert 弹出框组件 异步传参数返回写法：
  _alertDialog() async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示信息标题'),
            content: Text('你确定要删除吗？'),
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: () {
                  Navigator.pop(context, 'Cancle');
                  print('取消');
                },
              ),
              FlatButton(
                child: Text("确定"),
                onPressed: () {
                  Navigator.pop(context, 'Ok');
                  print('确定');
                },
              )
            ],
          );
        });
    print(result);
  }

  //select弹出框组件
  _simpleDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('Select 单选按钮框'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text("Option A第一个值"),
              onPressed: () {
                Navigator.pop(context);
                print('点击第一个值');
              },
            ),
            Divider(color: Colors.grey), //表示一条线
            SimpleDialogOption(
              child: Text("Option B第二个值"),
              onPressed: () {
                Navigator.pop(context);
                print('B第二个值');
              },
            ),
            Divider(color: Colors.grey), //表示一条线
            SimpleDialogOption(
              child: Text("Option C第三个值"),
              onPressed: () {
                Navigator.pop(context);
                print('C第三个值');
              },
            ),
          ],
        );
      },
    );
  }

  //toast弹出提示框
  _toastDialog() {
    Fluttertoast.showToast(
        msg: "提示消息弹出框",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  //自定义弹出dialog框
  _customDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return CustomDialog(title: '关于我们', content: '内容展示区');
      },
    );
  }

  //自定义loading框
  _customLoading() {
    showDialog(
      context: context,
      builder: (context) {
        return LoadingDialog(text: '加载中...');
      },
    );
  }

  //自定义底部弹出框
  _bottomSheetDialog() {
    showModalBottomSheet(
      context: context,
      //如果isScrollControlled=false，弹窗部分最大高度只能我屏幕宽度的一半，如果为true,则没有这个限制
      isScrollControlled: false,
      builder: (ctx) {
        return ShowSheetDialog(
          items: ['相册', '相机'],
          title: '请选择图片来源',
          onTap: (index, title) {
            print(index);
            print(title);
          },
        );
      },
    );
  }

  //自定义底部弹出框ios样式弹窗
  _bottomCupertinoDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      builder: (ctx) {
        return ShowCupertinoDialog(
          items: ['北京', '上海', '天津', '深圳', '武汉', '广州', '杭州'],
          onTap: (index, item) {
            print(index);
            print(item);
          },
        );
      },
    );
  }

  // 中间弹窗
  _centerShowAlertDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        return ShowAlertDialog(
          title: '中间弹出框标题',
          content: '中间弹出框内容，很多内容中间弹出框内容，很多内容中间弹出框内容，很多内容中间弹出框内容，很多内容',
          contentAlign: TextAlign.center,
          onTap: (index) {
            print(index);
          },
          items: ['取消', '确认'],
        );
      },
    );
  }

  //ios风格弹出框 取消 确认
  _showCupertinoDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('提示'),
          content: Text('确认删除吗？'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('取消'),
              onPressed: () {
                print('取消');
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              child: Text('确认'),
              onPressed: () {
                print('确认');
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  // 关于详情弹出框带图文消息
  _showAboutDialog() {
    showAboutDialog(
      context: context,
      applicationIcon: Image.asset(
        'assets/images/2.jpg',
        height: 100,
        width: 100,
      ),
      applicationName: '应用程序',
      applicationVersion: '1.0.0',
      applicationLegalese: '你是，一枚有态度的程序员',
      children: <Widget>[
        Container(
          height: 30,
          color: Colors.red,
        ),
        Container(
          height: 50,
          color: Colors.green,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('弹出框组件页面'),
        actions: <Widget>[
          PopupMenuButton<String>(
            padding: EdgeInsets.zero,
            onSelected: printSelectValue,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              // 菜单项
              PopupMenuItem(
                value: '菜单1',
                child: ListTile(
                  leading: Icon(Icons.lock),
                  title: Text('选择菜单1'),
                ),
              ),
              // 分割线
              PopupMenuDivider(),
              PopupMenuItem(
                value: '菜单2',
                child: ListTile(
                  leading: Icon(Icons.scanner),
                  title: Text('选择菜单2'),
                ),
              )
            ],
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Alert弹出框组件--AlertDialog'),
              onPressed: () {
                this._alertDialog();
              },
            ),
            RaisedButton(
              child: Text('select弹出框组件--SimpleDialog'),
              onPressed: () {
                this._simpleDialog();
              },
            ),
            RaisedButton(child: Text('Toast提示弹出框组件'), onPressed: _toastDialog),
            RaisedButton(child: Text('自定义Dialog弹出框'), onPressed: _customDialog),
            RaisedButton(
                child: Text('自定义Loading弹出框'), onPressed: _customLoading),
            RaisedButton(
                child: Text('自定义底部弹出框'), onPressed: _bottomSheetDialog),
            RaisedButton(
              child: Text('自定义底部弹出框ios样式弹窗'),
              onPressed: _bottomCupertinoDialog,
            ),
            RaisedButton(
              child: Text('中间弹窗'),
              onPressed: _centerShowAlertDialog,
            ),
            RaisedButton(
              child: Text('ios风格弹出框'),
              onPressed: _showCupertinoDialog,
            ),
            RaisedButton(
              child: Text('关于详情弹出框带图文消息'),
              onPressed: _showAboutDialog,
            ),
            DropdownButton(
              //icon: Icon(Icons.add),
              hint: Text('请选择'),
              iconSize: 24,
              iconDisabledColor: Colors.red,
              iconEnabledColor: Colors.red,
              value: _dropValue,
              items: [
                DropdownMenuItem(
                  child: Text('语文', style: TextStyle(color: Colors.red)),
                  value: '语文',
                ),
                DropdownMenuItem(
                    child: Text('数学', style: TextStyle(color: Colors.green)),
                    value: '数学'),
                DropdownMenuItem(
                    child: Text('英语', style: TextStyle(color: Colors.yellow)),
                    value: '英语'),
              ],
              onChanged: (value) {
                setState(() {
                  _dropValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
