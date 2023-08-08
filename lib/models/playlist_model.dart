import '../models/api_user_model.dart';

import './song_model.dart';

class Playlist {
  final int id;
  final String title;
  List<Song>? songs;
  final String imageUrl;
  ApiUser? apiUser;

  Playlist({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.songs,
    this.apiUser,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) {
    List<Song> songs = [];

    if (json['tracks'] != null) {
      print(json['tracks']['data'][0]['artist']);
      for (Map<String, dynamic> song in json['tracks']['data']) {
        print(song);

        songs.add(Song.fromJson(song));
      }
    }

    return Playlist(
      id: json['id'],
      title: json['title'],
      imageUrl: json['picture_big'],
      songs: songs,
    );
  }
}
