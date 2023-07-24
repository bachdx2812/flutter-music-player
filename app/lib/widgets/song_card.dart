import 'package:flutter/material.dart';

import '../models/song_model.dart';

class SongCard extends StatelessWidget {
  final Song song;

  const SongCard({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(song.coverUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ]),
    );
  }
}
