class Song {
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  Song(
      {required this.name,
      required this.images,
      required this.rating,
      required this.totalTime});

  factory Song.fromJson(dynamic json) {
    return Song(
        name: json['name'] as String,
        images: json['images'][0]['hostedLagreUrl'] as String,
        rating: json['rating'] as double,
        totalTime: json['totalTime'] as String);
  }
  static Iterable<Song> songsFromSnapshot(List snapshot) {
    return snapshot.map((data) => Song.fromJson(data)).toList();
  }
}
