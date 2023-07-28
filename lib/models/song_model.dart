class Song {
  final BigInt id;
  final String title;
  final String url;
  final String coverUrl;

  Song({
    required this.id,
    required this.title,
    required this.url,
    required this.coverUrl,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: BigInt.from(json['id']),
      title: json['title'],
      url: json['preview'],
      coverUrl: json['album']['cover_medium'],
    );
  }
}
