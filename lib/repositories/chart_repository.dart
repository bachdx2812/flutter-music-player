import '../utilities/api.dart';

class ChartRepository {
  static fetchChart() async {
    return await getRequest(endpoint: "chart");
  }
}
