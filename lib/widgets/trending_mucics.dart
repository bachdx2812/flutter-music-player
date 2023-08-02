import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../widgets/song_card.dart';
import '../widgets/section_header.dart';

import '../controllers/songs_controller.dart';

class TrendingMusic extends StatefulWidget {
  const TrendingMusic({
    super.key,
  });

  @override
  State<TrendingMusic> createState() => _TrendingMusicState();
}

class _TrendingMusicState extends State<TrendingMusic> {
  static final SongsController _songsController = Get.put(SongsController());

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _songsController.fetchSongs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          top: 20.0,
          bottom: 20.0,
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: SectionHeader(
                title: "Trending Music",
                action: "View More",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _songsController.trendingSongsListLoading.value
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * 0.27,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade400,
                      highlightColor: Colors.grey.shade100,
                      enabled: true,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, _) {
                          return const Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              SongCard(
                                song: null,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height * 0.27,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _songsController.trendingSongsList.length,
                      itemBuilder: (context, index) {
                        return SongCard(
                          song: _songsController.trendingSongsList[index],
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
