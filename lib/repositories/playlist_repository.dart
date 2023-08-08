import 'package:music_player_app/utilities/api.dart';

import '../models/playlist_model.dart';

class PlaylistRepository {
  static Future<Playlist?> fetchPlaylistDetail(playlistId) async {
    Playlist? playlist;

    var response =
        await getRequest(endpoint: "playlist/$playlistId", responseKey: null);

    if (response != null) {
      playlist = Playlist.fromJson(response);
    }

    return playlist;
  }
}
