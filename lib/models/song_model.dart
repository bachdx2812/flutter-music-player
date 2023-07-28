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

  static List<Song> songs = [
    //   Song(
    //     title: 'Glass',
    //     description: 'Glass',
    //     url: 'assets/music/glass.mp3',
    //     coverUrl: 'assets/images/glass.jpg',
    //   ),
    //   Song(
    //     title: 'Illusions',
    //     description: 'Illusions',
    //     url: 'assets/music/illusions.mp3',
    //     coverUrl: 'assets/images/illusions.jpg',
    //   ),
    //   Song(
    //     title: 'Pray',
    //     description: 'Pray',
    //     url: 'assets/music/pray.mp3',
    //     coverUrl: 'assets/images/pray.jpg',
    //   )
  ];

  // TODO: factory

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: BigInt.from(json['id']),
      title: json['title'],
      url: json['preview'],
      coverUrl: json['album']['cover_medium'],
    );
  }
}
