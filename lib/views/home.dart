import 'dart:convert';
import 'package:music_app/models/song.dart';

import 'package:flutter/material.dart';
import 'package:music_app/views/widgets/song_card.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/models/song.api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data;
  var response;
  @override
  Future getSong() async {
    var url = Uri.parse(
        "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7");
    response = await http.get(url);
    data = json.decode(response.body);
    print(data["message"]["body"]["track_list"][0]["track"]["track_name"]);
  }

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
                print(data["message"]["body"]["track_list"][0]["track"]
                    ["track_name"]);
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
      body: Container(
        child: Column(
          children: [
            for (var i in data["message"]["body"]["track_list"])
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SongCard(
                          name: 'san',
                          artist_name: 'san',
                          totalTime: 'saad',
                          album_name: 'sad',
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(i["track"]["track_name"],
                                style: TextStyle(fontSize: 4)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              i["track"]["album_name"],
                              style: TextStyle(fontSize: 4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(i["track"]["artist_name"],
                                style: TextStyle(fontSize: 4)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
//   body: _isLoading ? Center(child: CircularProgressIndicator()) : ListView.builder(
// itemCount: _songs.length,
// itemBuilder: (context,index){
//   return SongCard(
//     title: _songs[index].name,
//     rating: _songs[index].rating.toString(),
//     songTime: _songs[index].totalTime,
//   );
// },

//(data["message"]["body"]["track_list"])

//     SongCard(
//   title: 'san',
//   songTime: '3min',
//   rating: '3.4',
// ),
