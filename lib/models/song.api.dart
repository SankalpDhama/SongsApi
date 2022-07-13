import 'dart:convert';
import 'package:music_app/models/song.dart';
import 'package:http/http.dart' as http;

class SongApi {






  static Future<Song> async <Song>> getSong() async{
    var uri = Uri.parse(
        "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7");
    final response= await http.get(uri,headers:{

    });

    Map data=jsonDecode(response.body);
    List _temp=[];
    for(var i in data['feed']){
      _temp.add(i['saf']['sad']);
    }
    return Song.songsFromSnapshot(_temp);
  }
}
