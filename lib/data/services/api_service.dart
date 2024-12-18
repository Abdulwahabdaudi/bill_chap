import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:outer_pos_app/helpers/api_helper.dart';

class ApiService {
  Future<dynamic> get(String endpoint) async {
    final response = await http.get(ApiHelper.buildUri('/$endpoint'));
    return _processResponse(response);
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      ApiHelper.buildUri('/$endpoint'),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );
    return _processResponse(response);
  }

  dynamic _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error: ${response.statusCode}, ${response.body}');
    }
  }
}
