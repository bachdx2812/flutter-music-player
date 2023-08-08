import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../configurations/colors_config.dart';

import '../models/playlist_model.dart';

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({
    super.key,
    required this.playlist,
  });

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/playlist', arguments: {
          'id': playlist.id,
        });
      },
      child: Container(
        height: 75,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: ColorsConfig.primary.withOpacity(0.7),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                playlist.imageUrl,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    playlist.title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  Text(
                    '10',
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                Get.toNamed('/playlist', arguments: {
                  'id': playlist.id,
                });
              },
              icon: const Icon(
                Icons.play_circle,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
