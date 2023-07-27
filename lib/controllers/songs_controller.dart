import "package:get/get.dart";

import "../repositories/song_repository.dart";

class SongsController extends GetxController {
  var songsList = [].obs;

  setSongsList(value) {
    songsList.value = value;
  }

  fetchSongs() async {
    var query = {'q': 'suni ha linh'};

    var result = await SongRepository.fetchList(query);
  }
}
