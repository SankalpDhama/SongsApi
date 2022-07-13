import 'dart:convert';
import '';
import 'package:flutter/material.dart';
import 'package:music_app/views/widgets/song_card.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/views/models/song.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Song> _songs;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
  }

  Future<void> getSong() async {
    _songs= await SongApi.getSong();
    setState{(){
      _isLoading =false;
    });
  print(_songs);
  }

  var response;
  var data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () async {
                var url = Uri.parse(
                    "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7");
                response = await http.get(url);
                data = json.decode(response.body);
                print(data["message"]["body"]["track_list"]);
              },
              child: Text("bitch"),
            ),
            Icon(Icons.music_note),
            SizedBox(
              width: 10,
            ),
            Text("Songs"),
          ],
        ),
      ),
      body: //(data["message"]["body"]["track_list"])
          SongCard(
        title: 'san',
        songTime: '3min',
        rating: '3.4',
      ),
    );
  }
}
