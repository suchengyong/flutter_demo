import 'package:flutter/material.dart';
import 'PlayerPage.dart';
import 'components/audio_player_shotcut.dart';

class IndexPlayerList extends StatefulWidget {
  IndexPlayerList({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<IndexPlayerList> {
  List _list = [
    {
      "name": "看透爱情看透你",
      "url": "http://mp3.9ku.com/hot/2009/08-27/186947.mp3",
      "image":
          "https://p2.music.126.net/E4SutsrpldXS_F2kBGDx6A==/109951164337533802.jpg?param=50y50",
      "image_blur":
          "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2826345201,3743297607&fm=26&gp=0.jpg",
    },
    {
      "name": "屋顶",
      "url":
          "https://webfs.yun.kugou.com/202007131650/b16c7fe4b982be06f7efa4014750efe1/G194/M06/03/18/opQEAF5k-GuAMTHWAE3pVy4UFPw322.mp3",
      "image":
          "https://p3fx.kgimg.com/stdmusic/20160908/20160908233039729642.jpg",
      "image_blur":
          "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2826345201,3743297607&fm=26&gp=0.jpg",
      "lyric":
          "[00:00.000] 作曲 : 周杰伦\n[00:01.000] 作词 : 周杰伦\n[00:23.97]半夜睡不着觉把心情哼成歌\n[00:29.23]只好到屋顶找另一个梦境\n[00:39.99]睡梦中被敲醒我还是不确定\n[00:45.53]怎会有动人弦律在对面的屋顶\n[00:51.00]我悄悄关上门带着希望上去\n[00:56.43]原来是我梦里常出现的那个人\n[01:00.60]那个人不就是我梦里\n[01:03.67]那模糊的人\n[01:05.97]我们有同样的默契\n[01:11.56]用天线\n[01:12.86]用天线排成爱你的形状hoho\n[01:21.20]在屋顶唱着你的歌\n[01:23.95]在屋顶和我爱的人\n[01:26.56]让星星点缀成最浪漫的夜晚\n[01:32.55]拥抱这时刻这一分一秒全都停止\n[01:40.74]爱开始纠结\n[01:42.88]在屋顶唱着你的歌\n[01:45.67]在屋顶和我爱的人\n[01:48.40]将泛黄的的夜献给最孤独的月\n[01:54.44]拥抱这时刻这一分一秒全都停止\n[02:02.50]爱开始纠结\n[02:05.00]梦有你而美\n[02:42.79]半夜睡不着觉把心情哼成歌\n[02:48.41]只好到屋顶找另一个梦境\n[02:59.21]睡梦中被敲醒我还是不确定\n[03:04.73]怎会有动人弦律在对面的屋顶\n[03:10.21]我悄悄关上门带着希望上去\n[03:15.65]原来是我梦里常出现的那个人\n[03:19.79]那个人不就是我梦里\n[03:23.15]那模糊的人\n[03:25.90]我们有同样的默契\n[03:30.59]用天线\n[03:31.99]用天线排成爱你的形状hoho\n[03:40.50]在屋顶唱着你的歌\n[03:42.97]在屋顶和我爱的人\n[03:45.67]让星星点缀成最浪漫的夜晚\n[03:51.70]拥抱这时刻这一分一秒全都停止\n[03:59.90]爱开始纠结\n[04:01.88]在屋顶唱着你的歌\n[04:04.77]在屋顶和我爱的人\n[04:07.51]将泛黄的的夜献给最孤独的月\n[04:13.56]拥抱这时刻这一分一秒全都停止\n[04:21.83]爱开始纠结\n[04:24.15]梦有你而美\n[04:37.50]让我爱你是谁\n[04:40.20]让你爱我是谁\n[04:42.43]怎会有动人弦律环绕在我俩的身边\n[04:48.37]让我爱你是谁\n[04:51.15]让你爱我是谁\n[04:53.91]原来是这屋顶有美丽的邂逅\n[05:03.79]在屋顶唱着你的歌\n[05:07.10]在屋顶和我爱的人\n"
    },
    {
      "name": "夏天的风",
      "url":
          "https://webfs.yun.kugou.com/202007131323/5c01eaa2fae5103d10828421fe7314b9/G213/M0A/06/15/FQ4DAF6rtxeAZwBIADyqa6ttqjo897.mp3",
      "image":
          "https://p3fx.kgimg.com/stdmusic/20160907/20160907221352180114.jpg",
      "image_blur":
          "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2826345201,3743297607&fm=26&gp=0.jpg",
      "lyric": "",
    },
    {
      "name": "佛经",
      "url":
          "http://39.100.157.55/chanyunImage/chanyunImage/mp3/%E4%BA%91%E6%B3%89%E6%B3%95%E5%B8%88%20-%20%E4%BD%9B%E7%BB%8F.mp3",
      "image":
          "https://p3fx.kgimg.com/stdmusic/20200602/20200602192746598747.jpg",
      "image_blur":
          "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2826345201,3743297607&fm=26&gp=0.jpg",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            '音乐播放器实现效果',
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          AudioPlayerShotCut(
            size: 44,
            onTap: () {
              //
              print("AudioPlayerShotCut onTap");
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PlayerPage();
              }));
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return _cell(index);
        },
        itemCount: _list.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _cell(int index) {
    Map song = _list[index];
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PlayerPage(
              song: song,
            );
          }));
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          height: 44,
          color: Colors.white,
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(song["name"]),
              ),
            ],
          ),
        ));
  }
}
