import '../utilities/api.dart';

class ChartRepository {
  static fetchPlaylists() async {
    return await getRequest(
      endpoint: "chart",
      responseKey: 'playlists',
    );
  }
}
