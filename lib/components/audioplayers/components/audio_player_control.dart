//快速入口
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'audio_player_manager.dart';

class AudioPlayerControl extends StatefulWidget {
  final GestureTapCallback songListTap;

  AudioPlayerControl({Key key,this.songListTap}) : super(key: key);

  @override
  _AudioPlayerControlState createState() => _AudioPlayerControlState();
}

class _AudioPlayerControlState extends State<AudioPlayerControl> {
  final AudioPlayManager _audioPlayManager = AudioPlayManager();

  @override
  void initState() {
    super.initState();
    initListener();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  void initListener() {
    //监听播放状态
    _audioPlayManager.player.onPlayerStateChanged.listen((AudioPlayerState s) {
      if (mounted){
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //上一首
          Container(
            child: IconButton(
              icon: Icon(Icons.first_page),
              iconSize: 44,
              onPressed: () {
                _audioPlayManager.prev();
              },
            ),
          ),
          //播放
          Container(
            child: IconButton(
              icon: Icon(
                  _audioPlayManager.player.state == AudioPlayerState.PLAYING
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_filled),
              iconSize: 44,
              onPressed: () {
                _audioPlayManager.playOrPause();
              },
            ),
          ),
          //下一首
          Container(
            child: IconButton(
              icon: Icon(Icons.last_page),
              iconSize: 44,
              onPressed: () {
                _audioPlayManager.next();
              },
            ),
          ),
          //播放列表
          Container(
            child: IconButton(
              icon: Icon(Icons.queue_music),
              iconSize: 44,
              onPressed: () {
                if (widget.songListTap!=null){
                  widget.songListTap();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
