import 'package:latihan_responsi_60/base_network.dart';

class ApiDataSourceNews {
  static ApiDataSourceNews instance = ApiDataSourceNews();

  Future<Map<String, dynamic>> loadNews() {
    return BaseNetwork.get("articles/");
  }

  Future<Map<String, dynamic>> loadDetailNews(int idget) {
    String id = idget.toString();
    return BaseNetwork.get("articles/$id");
  }
}
