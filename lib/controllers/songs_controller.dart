import "package:get/get.dart";

import "../models/song_model.dart";
import "../repositories/song_repository.dart";

class SongsController extends GetxController {
  var trendingSongsList = <Song>[].obs;
  var trendingSongsListLoading = true.obs;

  fetchSongs([int limit = 5]) async {
    trendingSongsListLoading.value = true;

    List<Song> returnData = [];

    var query = {'q': 'suni ha linh', 'limit': limit.toString()};

    var result = await SongRepository.fetchList(query);

    if (result != null) {
      for (Map<String, dynamic> song in result) {
        returnData.add(Song.fromJson(song));
      }
    }

    trendingSongsList.value = returnData;
    trendingSongsListLoading.value = false;
  }
}
