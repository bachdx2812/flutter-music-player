class Artist {
  final int id;
  final String name;
  String? pictureSmall;
  String? pictureBig;

  Artist({
    required this.id,
    required this.name,
    this.pictureSmall,
    this.pictureBig,
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
