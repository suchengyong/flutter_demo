import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  ButtonPage({Key key}) : super(key: key);

  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('按钮页面标题'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    elevation: 10,
                    child: Text('普通按钮'),
                    onPressed: () {}),
                SizedBox(width: 10),
                Container(
                  height: 50,
                  width: 150,
                  child: RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      elevation: 10,
                      child: Text('设置按钮宽高'),
                      onPressed: () {}),
                )
              ],
            ),
            Row(children: <Widget>[
              Expanded(
                child: Container(
                  height: 50,
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      elevation: 10,
                      child: Text('自适应按钮'),
                      onPressed: () {}),
                ),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              RaisedButton.icon(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {},
                  icon: Icon(Icons.home),
                  label: Text('带图标的按钮')),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                splashColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('圆角按钮'),
                onPressed: () {},
              ),
              Container(
                height: 80,
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  shape: CircleBorder(
                    side: BorderSide(color: Colors.blue),
                  ),
                  child: Text('圆形按钮'),
                  onPressed: () {},
                ),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('扁平按钮'),
                onPressed: () {},
              ),
              SizedBox(width: 10),
              OutlineButton(
                  highlightColor: Colors.blue,
                  highlightElevation: 10,
                  color: Colors.white, //没有效果
                  hoverColor: Colors.white,
                  textColor: Colors.blue,
                  borderSide: BorderSide(
                      //线条颜色设置
                      color: Colors.blue,
                      style: BorderStyle.solid),
                  child: Text('线条按钮'),
                  onPressed: () {}),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonBar(//按钮组
                    children: <Widget>[
                  RaisedButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text('按钮组1'),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text('按钮组2'),
                    onPressed: () {},
                  )
                ]),
                //使用自定义按钮
                MyButton(
                  width: 110.0,
                  height: 50.0,
                  name: '自定义按钮',
                  pressed: () {
                    print('自定义按钮触发了');
                  },
                ),
                //浮动按钮 也是圆形按钮
                FloatingActionButton(child: Text('浮动按钮'), onPressed: () {}),
              ],
            ),
            SelfButton(),
            SizedBox(height: 20),
            MaterialButton(),
          ]),
    );
  }
}

//自定义按钮 组件
class MyButton extends StatelessWidget {
  final String name;
  final pressed;
  final double height;
  final double width;
  final color;
  final textColor;
  const MyButton(
      {this.name = '默认值',
      this.pressed,
      this.width = 80.0,
      this.height = 40.0,
      this.color = Colors.blue,
      this.textColor = Colors.white,
      key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      child: RaisedButton(
        color: this.color,
        textColor: this.textColor,
        child: Text(this.name),
        onPressed: this.pressed,
      ),
    );
  }
}

// 这是一个自定义按钮
class SelfButton extends StatelessWidget {
  const SelfButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          print('单击事件');
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          child: Text(
            '这是一个自定义按钮',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}

//自定义实现按钮水波纹
class MaterialButton extends StatelessWidget {
  const MaterialButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Ink(
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          print('单击--自定义实现按钮水波纹');
        },
        onLongPress: () {
          print('长按---自定义实现按钮水波纹');
        },
        onDoubleTap: () {
          print('双击---自定义实现按钮水波纹');
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            '自定义实现按钮水波纹',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    ));
  }
}
