import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../extensions/hex_to_color.dart';

import '../models/song_model.dart';

class SongCard extends StatelessWidget {
  final Song? song;

  const SongCard({super.key, this.song});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        song != null ? Get.toNamed('/song', arguments: song) : null;
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: NetworkImage(
                    song != null
                        ? song!.coverUrl
                        : "https://placehold.co/600x400/png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.37,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white.withOpacity(0.9),
              ),
              child: song != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 90.0,
                              child: Text(
                                song!.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color:
                                          "#FE6847".toColor().withOpacity(0.8),
                                      fontWeight: FontWeight.bold,
                                    ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              ),
                            ),
                            SizedBox(
                              width: 90.0,
                              child: Text(
                                song!.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color:
                                          "#F5AC9B".toColor().withOpacity(0.8),
                                      fontWeight: FontWeight.bold,
                                    ),
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              ),
                            )
                          ],
                        ),
                        const Icon(
                          Icons.play_circle,
                          color: Colors.deepOrange,
                        ),
                      ],
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
