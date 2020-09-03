import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('容器组件'),
      ),
      body: Container(
        // 撑满整个容器
        constraints: BoxConstraints.expand(),
        margin: EdgeInsets.all(30),
        padding: EdgeInsets.all(50),
        alignment: Alignment.center,
        // 使用主题颜色设置背景
        //color: Theme.of(context).accentColor,
        decoration: BoxDecoration(
          // 设置 形状 BoxShape.circle圆形,BoxShape.rectangle正方形
          //shape: BoxShape.rectangle,// shape不能和圆角一起使用
          // 背景填充颜色
          color: Colors.amberAccent,
          // 四边 边框
          // border: Border.all(
          //   //边框颜色
          //   color: Colors.black12,
          //   //边框宽度
          //   width: 5,
          // ),
          // 单独一边 边框
          border: Border(
            // 下边框
            bottom: BorderSide(
              color: Colors.indigoAccent[100],
              width: 2.0,
              style: BorderStyle.solid, // 边框线条
            ),
          ),
          // 设置四边圆角
          //borderRadius:BorderRadius.circular(20),
          // 单独设置每个脚的圆角
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          //线性渐变效果,会覆盖背景颜色
          //gradient: LinearGradient(
          //colors: [Colors.redAccent, Colors.greenAccent, Colors.blueAccent],
          //begin:Alignment.topCenter,//开始位置
          //end:Alignment.bottomCenter,//结束位置
          //),
          // 经向渐变效果
          gradient: RadialGradient(
            colors: [Colors.redAccent, Colors.greenAccent, Colors.blueAccent],
          ),
          // 阴影效果
          boxShadow: [
            BoxShadow(
              color: Colors.green,
              blurRadius: 10.0,
              offset: Offset(1, 2), // 偏移量
              spreadRadius: 1.2, // 阴影扩散程度 整数向外扩散，负数向内扩散
            )
          ],
          // 设置背景图像 NetworkImage网络图像 本地图像AssetImage
          image: DecorationImage(
            //NetworkImage('https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1843157987,3741684346&fm=26&gp=0.jpg')
            image: AssetImage(
              'assets/images/2.jpg',
            ),
            alignment: Alignment.topCenter, // 图片显示位置
            repeat: ImageRepeat.noRepeat, // 图片是否重复
            fit: BoxFit.cover,
            // 添加图片的虑镜
            colorFilter: ColorFilter.mode(
              Colors.yellow[400].withOpacity(0.6),
              BlendMode.hardLight,
            ),
          ),
        ),
        // 前景装饰器 绘制在child之上
        foregroundDecoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1843157987,3741684346&fm=26&gp=0.jpg'))),
        child: Text('container 布局容器'),
      ),
    );
  }
}
