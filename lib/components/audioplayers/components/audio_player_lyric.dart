//歌词
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'audio_player_manager.dart';
import 'lyric/lyric_controller.dart';
import 'lyric/lyric_util.dart';
import 'lyric/lyric_widget.dart';

class AudioPlayerLyric extends StatefulWidget {
  final double width;
  final double height;
  AudioPlayerLyric({Key key, this.width, this.height}) : super(key: key);

  @override
  _AudioPlayerLyricState createState() => _AudioPlayerLyricState();
}

class _AudioPlayerLyricState extends State<AudioPlayerLyric>
    with TickerProviderStateMixin {
  final AudioPlayManager _audioPlayManager = AudioPlayManager();
  //是否显示选择器
  bool showSelect = false;
  //歌词控制器
  LyricController _lyricController;

  @override
  void initState() {
    initLyricController();
    initListener();
    super.initState();
  }

  @override
  void dispose() {
    _lyricController.dispose();
    super.dispose();
  }

  void initListener() {
    //监听播放状态
    _audioPlayManager.player.onPlayerStateChanged.listen((AudioPlayerState s) {
      if (mounted && _lyricController != null) {
        setState(() {});
      }
    });
    _audioPlayManager.player.onAudioPositionChanged.listen((Duration p) {
      if (p != null) {
        if (mounted && _lyricController != null) {
          _lyricController.progress = p;
        }
      }
    });
  }

  void initLyricController() {
    _lyricController = LyricController(vsync: this);
    //监听控制器
    _lyricController.addListener(() {
      if (mounted) {
        if (showSelect != _lyricController.isDragging) {
          setState(() {
            showSelect = _lyricController.isDragging;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_audioPlayManager.currentPlaySong == null) {
      return _noLyricWidget();
    }
    String lyric = _audioPlayManager.currentPlaySong["lyric"];
    if (lyric == null || lyric == "") {
      return _noLyricWidget();
    }
    var lyrics = LyricUtil.formatLyric(lyric);
    if (lyrics == null) {
      return _noLyricWidget();
    }
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Center(
            child: LyricWidget(
          size: Size(double.infinity, double.infinity),
          lyrics: lyrics,
          controller: _lyricController,
          currLyricStyle: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          lyricStyle: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.bold),
          draggingLyricStyle: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.bold),
        )),
        Offstage(
          offstage: !showSelect,
          child: Row(
            children: <Widget>[
              Container(
//                margin: EdgeInsets.only(left: 10),
                child: IconButton(
                  iconSize: 34,
                  icon: Icon(
                    Icons.play_circle_outline,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _lyricController.draggingComplete();
                    _audioPlayManager.player
                        .seek(_lyricController.draggingProgress);
                  },
                ),
              ),
              Expanded(
                  child: Divider(
                color: Colors.white,
                endIndent: 10.0,
              )),
            ],
          ),
        )
      ],
    );
  }

  Widget _noLyricWidget() {
    return Center(
      child: Text(
        "暂无歌词",
        style: TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
