class Artist {
  final int id;
  final String name;
  final String pictureSmall;
  final String pictureBig;

  Artist({
    required this.id,
    required this.name,
    required this.pictureSmall,
    required this.pictureBig,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      id: json['id'],
      name: json['name'],
      pictureSmall: json['picture_small'],
      pictureBig: json['picture_big'],
    );
  }
}
