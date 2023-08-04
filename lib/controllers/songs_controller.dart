import "package:get/get.dart";

import "../models/song_model.dart";
import "../repositories/song_repository.dart";

class SongsController extends GetxController {
  // Home screen
  var trendingSongsList = <Song>[].obs;
  var trendingSongsListLoading = true.obs;

  var searchText = "suni ha linh".obs;

  fetchSongs([int limit = 5]) async {
    trendingSongsListLoading.value = true;

    var query = {'q': searchText.value, 'limit': limit.toString()};
    var result = await SongRepository.fetchList(query);

    trendingSongsList.value = result;
    trendingSongsListLoading.value = false;
  }

  setSearchText(value) {
    searchText.value = value;
  }

  // Song screen
  var song = Rxn<Song>();

  fetchSongDetail(int songId) async {
    var result = await SongRepository.fetchSongDetail(songId);

    song.value = result;
  }
}
