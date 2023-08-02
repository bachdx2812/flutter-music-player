import '../models/api_user_model.dart';

class Playlist {
  final int id;
  final String title;
  // final List<Song> songs;
  final String imageUrl;
  ApiUser? apiUser;

  Playlist({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.apiUser,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      id: json['id'],
      title: json['title'],
      imageUrl: json['picture_medium'],
    );
  }
}
