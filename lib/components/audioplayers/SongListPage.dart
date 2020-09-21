import 'package:flutter/material.dart';
import 'components/audio_player_manager.dart';

class SongListPage extends StatefulWidget {
  final Map song;

  SongListPage({Key key, @required this.song}) : super(key: key);

  @override
  _SongListPageState createState() => _SongListPageState();
}

class _SongListPageState extends State<SongListPage> {
  final AudioPlayManager _audioPlayManager = AudioPlayManager();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(
            "播放列表",
            textAlign: TextAlign.center,
          ),
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return _cell(index);
          },
          itemCount: _audioPlayManager.audios.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        ));
  }

  Widget _cell(int index) {
    Map song = _audioPlayManager.audios[index];
    return GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(song["name"]),
              ),
              Container(
                height: 24,
                child: Text(song["url"]),
              ),
            ],
          ),
        ));
  }
}
