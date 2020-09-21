//模糊背景
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'audio_player_manager.dart';

class AudioPlayerBlurry extends StatefulWidget {
  final double width;
  final double height;
  AudioPlayerBlurry({Key key,this.width,this.height}) : super(key: key);

  @override
  _AudioPlayerBlurryPage createState() => _AudioPlayerBlurryPage();
}

class _AudioPlayerBlurryPage extends State<AudioPlayerBlurry> {
  final AudioPlayManager _audioPlayManager = AudioPlayManager();

  @override
  void initState() {
    super.initState();
    initListener();
  }
  @override
  void dispose() {
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
    if (_audioPlayManager.currentPlaySong==null){
      return Container();
    }
    String imageUrl = _audioPlayManager.currentPlaySong["image_blur"];
    if (imageUrl==null){
      return Container();
    }
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
//      child: BackdropFilter( //背景滤镜
//        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),//背景模糊化
//        child: Container(
//        ),
//      ),
    );
  }
}
