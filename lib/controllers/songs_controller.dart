import "package:get/get.dart";

import "../models/song_model.dart";
import "../repositories/song_repository.dart";

class SongsController extends GetxController {
  var songsList = <Song>[].obs;

  setSongsList(value) {
    songsList.value = value;
  }

  fetchSongs() async {
    List<Song> returnData = [];

    var query = {'q': 'suni ha linh'};

    var result = await SongRepository.fetchList(query);

    if (result != null) {
      for (Map<String, dynamic> song in result) {
        returnData.add(Song.fromJson(song));
      }
    }

    songsList.value = returnData;
  }
}
