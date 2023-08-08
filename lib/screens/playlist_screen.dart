import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../configurations/colors_config.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/navigation_bar.dart';

import '../controllers/playlists_controller.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  static final PlaylistsController _playlistsController =
      Get.put(PlaylistsController());
  final int playlistId = Get.arguments['id'];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _playlistsController.fetchPlaylistDetail(playlistId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorsConfig.primary.withOpacity(0.8),
            ColorsConfig.secondary.withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("Playlist"),
        ),
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                _playlistsController.playlist.value != null
                    ? Image(
                        image: NetworkImage(
                          _playlistsController.playlist.value!.imageUrl,
                        ),
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.height * 0.3,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
