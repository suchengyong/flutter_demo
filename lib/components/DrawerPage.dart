import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  DrawerPage({Key key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        //头部导航烂
        title: Text('侧边栏'),
      ),
      //定义左侧边栏
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: UserAccountsDrawerHeader(
                    accountName: Text(
                      '你好flutter',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.0,
                      ),
                    ),
                    accountEmail: Text('suchengyon@163.com'),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598862186923&di=9db8f969f887de5c09456f8c921d5112&imgtype=0&src=http%3A%2F%2Fimg11.360buyimg.com%2Fn0%2Fg14%2FM05%2F1A%2F1D%2FrBEhVlJ9tEoIAAAAAAdi8x4EtPkAAFQiwBc8lMAB2ML870.jpg',
                      ),
                    ),
                    otherAccountsPictures: <Widget>[
                      Image.network(
                        'https://www.itying.com/images/flutter/2.png',
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        'https://www.itying.com/images/flutter/5.png',
                        fit: BoxFit.cover,
                      ),
                    ],
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                        //设置背景
                        image: NetworkImage(
                          'https://www.itying.com/images/flutter/4.png',
                        ),
                        fit: BoxFit.cover,
                        // 添加虑镜
                        colorFilter: ColorFilter.mode(
                          Colors.yellow[400].withOpacity(0.6),
                          BlendMode.hardLight,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.home),
              ),
              title: Text("你好欢迎打开左侧边栏"),
            ),
            Divider(), //是一条线
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.people),
              ),
              title: Text("用户中心"),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Divider(), //是一条线
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
              title: Text("我的空间"),
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
      //定义右侧边栏
      endDrawer: Drawer(
        child: Center(
          child: Text("你好欢迎打开右侧边栏"),
        ),
      ),
      body: Center(
        child: Text('侧边栏'),
      ),
    );
  }
}
