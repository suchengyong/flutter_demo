import 'package:flutter/material.dart';
import 'components/audio_player_manager.dart';
import 'SongListPage.dart';
import 'components/audio_player_header.dart';

class PlayerPage extends StatefulWidget {
  final Map song;
  PlayerPage({Key key, this.song}) : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  final AudioPlayManager _audioPlayManager = AudioPlayManager();
  //是否显示歌词，默认不显示，通过点击"歌词"按钮或者点击屏幕空白区域进行显示或隐藏
  bool _isShowLyric = false;
  @override
  void initState() {
    super.initState();
    if (widget.song != null) {
      _audioPlayManager.playSongList(songList: [widget.song]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "${_audioPlayManager.currentPlaySong["name"]}",
            textAlign: TextAlign.center,
          ),
        ),
        body: Stack(
          children: [
            //模糊背景
            AudioPlayerBlurry(
              width: width,
              height: height,
            ),
            Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      _isShowLyric = !_isShowLyric;
                      setState(() {});
                    },
                    child: Stack(
                      children: [
                        //歌词
                        AnimatedOpacity(
                          duration: Duration(milliseconds: 100),
                          opacity: _isShowLyric == true ? 1 : 0,
                          child: AudioPlayerLyric(),
                        ),
                        //唱片
//                        AnimatedOpacity(
//                          duration: Duration(milliseconds: 100),
//                          opacity: _isShowLyric==true?0:1,
//                          child: AudioPlayerDisc(size: width-80,),
//                        ),
                        Offstage(
                          offstage: _isShowLyric,
                          child: AudioPlayerDisc(
                            size: width - 80,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //进度滚动条
                AudioPlayerSlider(),
                _playControlWidget(),
              ],
            )
          ],
        ));
  }

  //播放控制区域
  Widget _playControlWidget() {
    return AudioPlayerControl(
      songListTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SongListPage(
            song: widget.song,
          );
        }));
      },
    );
  }
}
