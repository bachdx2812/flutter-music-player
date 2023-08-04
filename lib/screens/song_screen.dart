import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../configurations/colors_config.dart';
import '../controllers/songs_controller.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({super.key});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  static final SongsController _songsController = Get.put(SongsController());
  final int songId = Get.arguments['id'];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _songsController.fetchSongDetail(songId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Obx(
        () => Stack(
          fit: StackFit.expand,
          children: [
            Image(
              image: NetworkImage(
                _songsController.song.value != null
                    ? _songsController.song.value!.coverXl
                    : "https://placehold.co/400x600/png",
              ),
              fit: BoxFit.cover,
            ),
            ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.0),
                    ],
                    stops: const [
                      0.0,
                      0.4,
                      0.6
                    ]).createShader(rect);
              },
              blendMode: BlendMode.dstOut,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ColorsConfig.secondary,
                      ColorsConfig.primary,
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
