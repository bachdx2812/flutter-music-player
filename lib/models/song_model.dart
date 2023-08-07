class Song {
  final int id;
  final String title;
  final String url;
  final String coverMedium;
  final String coverXl;
  final String preview;

  Song({
    required this.id,
    required this.title,
    required this.url,
    required this.coverMedium,
    required this.coverXl,
    required this.preview,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'],
      title: json['title'],
      url: json['preview'],
      coverMedium: json['album']['cover_medium'],
      coverXl: json['album']['cover_xl'],
      preview: json['preview'],
    );
  }
}
