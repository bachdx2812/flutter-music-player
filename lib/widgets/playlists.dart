import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/chart_controller.dart';

import '../models/playlist_model.dart';

import '../widgets/section_header.dart';
import '../widgets/playlist_card.dart';

class Playlists extends StatefulWidget {
  const Playlists({super.key});

  @override
  State<Playlists> createState() => _PlaylistsState();
}

class _PlaylistsState extends State<Playlists> {
  static final ChartController _chartController = Get.put(ChartController());

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _chartController.fetchChart();
    });
  }

  List<Playlist> playlists = Playlist.playlists;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SectionHeader(title: 'Playlists'),
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 20),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: playlists.length,
            itemBuilder: (context, index) {
              return PlaylistCard(playlist: playlists[index]);
            },
          )
        ],
      ),
    );
  }
}
