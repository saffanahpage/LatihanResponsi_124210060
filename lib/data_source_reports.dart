import 'package:latihan_responsi_60/base_network.dart';

class ApiDataSourceReport {
  static ApiDataSourceReport instance = ApiDataSourceReport();

  Future<Map<String, dynamic>> loadReports() {
    return BaseNetwork.get("reports/");
  }

  Future<Map<String, dynamic>> loadDetailReports(int idget) {
    String id = idget.toString();
    return BaseNetwork.get("reports/$id");
  }
}
