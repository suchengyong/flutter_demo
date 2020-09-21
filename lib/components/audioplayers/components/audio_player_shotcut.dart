//快速入口
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'audio_player_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AudioPlayerShotCut extends StatefulWidget {
  final double size;
  final GestureTapCallback onTap;
  AudioPlayerShotCut({Key key,this.size=24.0,this.onTap}) : super(key: key);

  @override
  _AudioPlayerShotCutState createState() => _AudioPlayerShotCutState();
}

class _AudioPlayerShotCutState extends State<AudioPlayerShotCut> with TickerProviderStateMixin{
  final AudioPlayManager _audioPlayManager = AudioPlayManager();
  AnimationController _rotationController;
  Animation _rotationAnimation;
  @override
  void initState() {
    super.initState();
    initAnimation();
  }
  void initAnimation(){
    _rotationController =
        AnimationController(duration: const Duration(seconds: 20), vsync: this);
    _rotationAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_rotationController);
    _rotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _rotationController.reset();
      } else if (status == AnimationStatus.dismissed) {
        _rotationController.forward();
      }
    });
    _rotationController.forward();
    //监听播放状态
    _audioPlayManager.player.onPlayerStateChanged.listen((AudioPlayerState s) {
      if (mounted){
        if (s == AudioPlayerState.PLAYING) {
          //曲目切换或许在这里吧
          setState(() {
          });
          _rotationController.forward();
        } else {
          _rotationController.stop();
        }
      }
    });
  }
  void dispose() {
    // TODO: implement dispose
    _rotationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if (_audioPlayManager.currentPlaySong==null){
      return Container();
    }
    String imageUrl = _audioPlayManager.currentPlaySong["image"];
    if (imageUrl==null){
      return Container();
    }
    return RotationTransition(
      alignment: Alignment.center,
      turns: _rotationAnimation,
      child:GestureDetector(
        onTap: (){
          widget.onTap();
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(2),
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(
                  widget.size * 0.5),
              border: Border.all(
                  color: Color(0xFFBD935A),
                  width: 2),
            ),
          ),
        ),
      ),
    );
  }

}