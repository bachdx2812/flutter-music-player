import 'package:get/get.dart';

import '../models/playlist_model.dart';

import '../repositories/playlist_repository.dart';

class PlaylistsController extends GetxController {
  var playlist = Rxn<Playlist>();

  fetchPlaylistDetail(int playlistId) async {
    var result = await PlaylistRepository.fetchPlaylistDetail(playlistId);

    playlist.value = result;
  }
}
