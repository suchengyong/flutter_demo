import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // 数据存储

// 增：数据，修改和新增是一样的，只需要再执行一次setXXX()方法即可覆盖之前的数据
// prefs.setString(key, value)
// prefs.setBool(key, value)
// prefs.setDouble(key, value)
// prefs.setInt(key, value)
// prefs.setStringList(key, value)
// 删：数据
//prefs.remove(key); //删除指定键
//prefs.clear();//清空键值对
// 查：数据
// prefs.getString(key)
// prefs.getBool(key)
// prefs.getDouble(key)
// prefs.getInt(key)
// prefs.getStringList(key)
class SharedPreferencesPage extends StatefulWidget {
  SharedPreferencesPage({Key key}) : super(key: key);

  @override
  _SharedPreferencesPageState createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  final String mUserName = "userName";
  var userNameData = '';
  final _userNameController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  save() async {
    // 初始化
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // 数据存储
    prefs.setString(mUserName, _userNameController.value.text.toString());
  }

  //数据获取
  Future<String> get() async {
    var userName;
    // 初始化
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // 获取数据
    userName = prefs.getString(mUserName);
    return userName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('数据存储和获取'),
        elevation: 0.0,
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Column(
            children: [
              TextField(
                controller: _userNameController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 10.0),
                  icon: Icon(Icons.perm_identity),
                  labelText: "请输入用户名",
                  helperText: "注册时填写的名字",
                ),
              ),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text("存储"),
                onPressed: () {
                  save();
                  Scaffold.of(context)
                      .showSnackBar(new SnackBar(content: Text("数据存储成功")));
                },
              ),
              Text("获取的数据是：" + this.userNameData),
              RaisedButton(
                color: Colors.greenAccent,
                child: Text("获取"),
                onPressed: () {
                  Future<String> userName = get();
                  userName.then((String userName) {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text("数据获取成功：$userName")));
                    setState(() {
                      userNameData = userName;
                    });
                  });
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
