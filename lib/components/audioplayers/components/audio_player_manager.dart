import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayManager {
  static final AudioPlayManager _singleT = AudioPlayManager._internal(); //1
  factory AudioPlayManager() {
    //2
    return _singleT;
  }

  AudioPlayer _player;

  AudioPlayer get player {
    return _player;
  }

  AudioPlayManager._internal() {
    initPlayer();
  }

  void initPlayer() {
    _player = AudioPlayer(playerId: "1");
    _player.mode = PlayerMode.MEDIA_PLAYER;
    _player.setReleaseMode(
        ReleaseMode.STOP); // set release mode so that it never releases
    //播放次数+1

    //监听播放进度
    _player.onDurationChanged.listen((Duration d) {
      if (d != null) {
        _duration = d;
      }
    });
    _player.onPlayerCompletion.listen((event) {
      print("onPlayerCompletion");
      next();
    });
  }

  //播放列表
  List _audios = [];

  List get audios {
    return _audios;
  }

  //当前播放曲目下标
  int _currentPlayIndex;

  //当前播放曲目
  Map _currentPlaySong;

  Map get currentPlaySong {
    return _currentPlaySong;
  }

  //歌曲总时长
  Duration _duration;

  Duration get duration {
    return _duration;
  }

  //当前播放进度
  Duration currentDuration;

  //播放指定曲目列表
  void playSongList({List songList}) {
    if (songList != null && songList.length > 0) {
      songList.forEach((element) {
        if (_audios.contains(element)) {
          _audios.remove(element);
        }
      });
      _audios.insertAll(0, songList);
    }
    if (_audios.length > 0) {
      playIndex(0);
    }
  }

  //播放指定曲目下标
  Future<void> playIndex(int index) async {
    if (index >= _audios.length) {
      return;
    }
    //
    _duration =Duration(seconds: 0);
    currentDuration =Duration(seconds: 0);
    _currentPlayIndex = index;
    Map song = _audios[index];
    if (song == _currentPlaySong) {
      return;
    }
    _currentPlaySong = song;
    String url = song["url"];
    if (url != null) {
      int result = await _player.play(url, stayAwake: true);
      print("play ,code =$result");
    }
  }

  //播放
  Future<void> play() async {
    if (_player.state == AudioPlayerState.PAUSED) {
      await _player.resume();
    } else if (_player.state == AudioPlayerState.COMPLETED ||
        _player.state == AudioPlayerState.STOPPED) {
      playIndex(_currentPlayIndex);
    }
  }

  //暂停
  Future<void> pause() async {
    int result = await _player.pause();
  }

  //播放或者暂停
  void playOrPause() {
    if (_player.state == AudioPlayerState.PLAYING) {
      pause();
    } else {
      play();
    }
  }

  //下一首
  void next() {
    if (_audios.length == 0) {
      return;
    }
    int index = _currentPlayIndex + 1;
    if (index >= _audios.length) {
      index = 0;
    }
    playIndex(index);
  }

  //上一首
  void prev() {
    if (_audios.length == 0) {
      return;
    }
    int index = _currentPlayIndex - 1;
    if (index < 0) {
      index = 0;
    }
    playIndex(index);
  }
}
