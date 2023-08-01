import "package:get/get.dart";
import "package:music_player_app/models/playlist_model.dart";
import "package:music_player_app/repositories/chart_repository.dart";

class ChartController extends GetxController {
  var playlists = <Playlist>[].obs;
  var playlistsLoading = true.obs;

  fetchChart() async {
    print("hereh");

    List<Playlist> returnData = [];

    var result = await ChartRepository.fetchPlaylists();

    if (result != null) {
      print(result);
    }
  }
}
