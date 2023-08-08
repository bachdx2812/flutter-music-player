import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../configurations/colors_config.dart';

import '../models/song_model.dart';

class SongCard extends StatelessWidget {
  final Song? song;

  const SongCard({super.key, this.song});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        song != null
            ? Get.toNamed('/song', arguments: {
                'id': song!.id,
              })
            : null;
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
                        ? song!.coverMedium
                        : "https://placehold.co/400x600/png",
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
                color: ColorsConfig.primary.withOpacity(0.7),
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
                                      color: Colors.white,
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
                                song!.artist.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.white,
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
                          color: Colors.white,
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
