import "package:get/get.dart";
import "package:music_player_app/models/playlist_model.dart";
import "package:music_player_app/repositories/chart_repository.dart";

class ChartController extends GetxController {
  var playlists = <Playlist>[].obs;
  var playlistsLoading = true.obs;

  fetchPlaylists([int limit = 5]) async {
    List<Playlist> returnData = [];

    var result = await ChartRepository.fetchPlaylists();

    if (result != null) {
      for (Map<String, dynamic> playlist in result['data'].take(limit)) {
        returnData.add(Playlist.fromJson(playlist));
      }
    }

    playlists.value = returnData;
  }
}
