import 'dart:convert';
import 'package:http/http.dart' as http;

class Song {
  final String name;
  final String album_name;
  final String artist_name;
  final String totalTime;

  Song(
      {required this.name,
      required this.album_name,
      required this.artist_name,
      required this.totalTime});
}

Future getSongData() async {
  var response = await http.get(Uri.https("api.musixmatch.com",
      "ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7"));
  var jsonData = jsonDecode(response.body);
  List<Song> songs = [];

  for (var u in jsonData) {
    Song song = Song(
      name: u['name'],
      totalTime: u['totalTime'],
      album_name: u['san'],
      artist_name: u['sa'],
    );

    songs.add(song);
  }
  print(jsonData["message"]["body"]["track_list"][0]["track"]["track_name"]);
  return songs;
}

// factory Song.fromJson(dynamic json) {
//   return Song(
//       name: json['name'] as String,
//       images: json['images'][0]['hostedLagreUrl'] as String,
//       rating: json['rating'] as double,
//       totalTime: json['totalTime'] as String);
// }
// static Iterable<Song> songsFromSnapshot(List snapshot) {
//   return snapshot.map((data) => Song.fromJson(data)).toList();
// }

//   @override
//   String toString() {
//     return 'Song{name: $name, image:$images, rating: $rating, totalTime: $totalTime}';
//   }
// }
