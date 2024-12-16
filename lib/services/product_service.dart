import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService {
  final String baseUrl = 'http://localhost:8000/api';

  Future<String> login(String phone, String password, String deviceName) async {
    final response = await http.get(
      Uri.parse('$baseUrl/product'),
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
