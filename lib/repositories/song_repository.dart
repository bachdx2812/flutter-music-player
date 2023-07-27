import '../utilities/api.dart';

class SongRepository {
  static fetchList(params) async {
    return await getRequest(endpoint: "search", params: params);
  }
}
