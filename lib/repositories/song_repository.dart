import '../models/song_model.dart';
import '../utilities/api.dart';

class SongRepository {
  static Future<List<Song>> fetchList(params) async {
    List<Song> returnData = [];

    var response = await getRequest(
      endpoint: "search",
      responseKey: 'data',
      params: params,
    );

    if (response != null) {
      for (Map<String, dynamic> song in response) {
        returnData.add(Song.fromJson(song));
      }
    }

    return returnData;
  }

  static Future<Song?> fetchSongDetail(songId) async {
    Song? song;

    var response =
        await getRequest(endpoint: "track/$songId", responseKey: null);

    if (response != null) {
      song = Song.fromJson(response);
    }

    return song;
  }
}
