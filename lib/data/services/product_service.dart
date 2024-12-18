import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:outer_pos_app/helpers/api_helper.dart';

class ProductService {
  Future<String> login(String phone, String password, String deviceName) async {
    final response = await http.get(
      ApiHelper.buildUri('/products'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      return 'logged';
    } else {
      throw Exception('Failed to login');
    }
  }
}
