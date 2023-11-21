import 'package:latihan_responsi_60/base_network.dart';

class ApiDataSourceBlog {
  static ApiDataSourceBlog instance = ApiDataSourceBlog();

  Future<Map<String, dynamic>> loadBlogs() {
    return BaseNetwork.get("blogs/");
  }

  Future<Map<String, dynamic>> loadDetailBlogs(int idget) {
    String id = idget.toString();
    return BaseNetwork.get("blogs/$id");
  }
}
