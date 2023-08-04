class Song {
  final int id;
  final String title;
  final String url;
  final String coverMedium;
  String coverXl;

  Song({
    required this.id,
    required this.title,
    required this.url,
    required this.coverMedium,
    required this.coverXl,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'],
      title: json['title'],
      url: json['preview'],
      coverMedium: json['album']['cover_medium'],
      coverXl: json['album']['cover_xl'],
    );
  }
}
