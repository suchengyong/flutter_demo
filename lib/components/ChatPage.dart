import 'dart:math';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('聊天页面'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_horiz), onPressed: () {})
        ],
      ),
      body: ChatDetailList(),
    );
  }
}

///
class ChatDetailList extends StatelessWidget {
  const ChatDetailList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String avatarUrl0 =
        'https://pic2.zhimg.com/v2-bd46162e4c96d4046ec27a7cf48536cb_is.jpg';
    String avatarUrl1 =
        'https://pic1.zhimg.com/v2-f8c95bf6807a3773eb5679aae2892960_is.jpg';
    List<ChatRecord> records = List<ChatRecord>();
    records.add(ChatRecord(
      avatarUrl: avatarUrl0,
      sender: 0,
      chatType: 1,
      content: '豪华房发挥好',
    ));
    records.add(ChatRecord(
      avatarUrl: avatarUrl1,
      sender: 1,
      chatType: 1,
      content: '豪华房豪华房发挥好发挥好',
    ));
    records.add(ChatRecord(
      avatarUrl: avatarUrl0,
      sender: 0,
      chatType: 1,
      content: '我还在这等你呢',
    ));
    records.add(ChatRecord(
      avatarUrl: avatarUrl1,
      sender: 1,
      chatType: 1,
      content: '豪华房豪华房发好发挥好',
    ));
    records.add(ChatRecord(
      avatarUrl: avatarUrl1,
      sender: 1,
      chatType: 1,
      content: '豪华豪华房发挥好房发挥好',
    ));
    return ListView.builder(
      itemCount: records.length,
      itemBuilder: (context, index) {
        return ChatRow(
          sender: records[index].sender,
          avatarUrl: records[index].avatarUrl,
          content: records[index].content,
          chatType: records[index].chatType,
        );
      },
    );
  }
}

///
class ChatRow extends StatelessWidget {
  final int sender;
  final String content;
  final String avatarUrl;
  final int chatType;
  const ChatRow({
    Key key,
    @required this.sender,
    @required this.content,
    @required this.avatarUrl,
    @required this.chatType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20 * rpx, vertical: 20 * rpx),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment:
            sender == 0 ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 自己发的消息 sender == 1其他人sender == 0
          // 他人头像
          sender == 0
              ? Container(
                  margin: EdgeInsets.only(right: 20 * rpx),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(avatarUrl),
                  ))
              : Container(),
          // 他人绘制箭头
          sender == 0
              ? Container(
                  child: CustomPaint(
                    painter: CanvasPainter(
                      height: 30 * rpx,
                      width: 50 * rpx,
                      color: Colors.greenAccent,
                    ),
                  ),
                )
              : Container(),
          // 文字展示内容区
          Container(
            width: 300 * rpx,
            child: Text(content),
            margin: EdgeInsets.symmetric(horizontal: 20 * rpx),
            padding: EdgeInsets.all(15 * rpx),
            decoration: BoxDecoration(
              color: sender == 0 ? Colors.greenAccent : Colors.redAccent,
              borderRadius: BorderRadius.circular(10 * rpx),
            ),
          ),
          // 自己发的消息 sender == 1
          // 自己消息箭头
          sender == 1
              ? Transform.rotate(
                  // 三角形旋转180度
                  angle: pi,
                  child: Container(
                    child: CustomPaint(
                      painter: CanvasPainter(
                        height: 15 * rpx,
                        width: 20 * rpx,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                )
              : Container(),
          // 自己头像
          sender == 1
              ? Container(
                  margin: EdgeInsets.only(left: 20 * rpx),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(avatarUrl),
                  ))
              : Container(),
        ],
      ),
    );
  }
}

// 绘制一个三角形
class CanvasPainter extends CustomPainter {
  CanvasPainter(
      {@required this.width, @required this.height, @required this.color});
  final double width;
  final double height;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path()
      ..moveTo(0, height / 2)
      ..lineTo(width, height)
      ..lineTo(width, 0)
      ..lineTo(0, height / 2);

    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color
      ..strokeWidth = 1;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CanvasPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CanvasPainter oldDelegate) => false;
}

//造两个人聊天数据
class ChatRecord {
  int sender;
  String content;
  String avatarUrl;
  int chatType;
  ChatRecord({this.sender, this.avatarUrl, this.content, this.chatType});
}
