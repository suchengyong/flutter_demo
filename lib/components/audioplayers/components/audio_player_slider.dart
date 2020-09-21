//快速入口
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'audio_player_manager.dart';

class AudioPlayerSlider extends StatefulWidget {
  AudioPlayerSlider({Key key}) : super(key: key);

  @override
  _AudioPlayerSliderState createState() => _AudioPlayerSliderState();
}

class _AudioPlayerSliderState extends State<AudioPlayerSlider> {
  final AudioPlayManager _audioPlayManager = AudioPlayManager();

  @override
  void initState() {
    super.initState();
    initListener();
  }

  void initListener() {
    _audioPlayManager.player.onAudioPositionChanged.listen((Duration p) {
      if (p != null) {
        _audioPlayManager.currentDuration = p;
        if (mounted) {
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_audioPlayManager.duration == null ||
        _audioPlayManager.currentDuration == null ||
        _audioPlayManager.currentDuration.inSeconds >
            _audioPlayManager.duration.inSeconds) {
      return Container();
    }
    return Row(
      children: [
        //播放时间
        Container(
          margin: EdgeInsets.only(left: 18),
          child: Text(
            "${durationToString(_audioPlayManager.currentDuration)}",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
        //播放进度
        Expanded(
          child: SliderTheme(
            child: Slider(
              min: 0,
              max: _audioPlayManager.duration.inSeconds.toDouble(),
              value: _audioPlayManager.currentDuration.inSeconds.toDouble(),
              onChanged: (value) {
                Duration pointDuration = Duration(seconds: value.toInt());
                _audioPlayManager.player.seek(pointDuration);
              },
            ),
            data: SliderThemeData(
                trackHeight: 1,
                thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: 4,
                ),
                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.white.withOpacity(0.5),
                thumbColor: Colors.white),
          ),
        ),
        //总时间
        Container(
          margin: EdgeInsets.only(right: 18),
          child: Text(
            "${durationToString(_audioPlayManager.duration)}",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ],
    );
  }

  //100秒转换为"01:40"
  static String durationToString(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }
    String twoDigitMinutes =
        twoDigits(duration.inMinutes.remainder(Duration.minutesPerHour));
    String twoDigitSeconds =
        twoDigits(duration.inSeconds.remainder(Duration.secondsPerMinute));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
