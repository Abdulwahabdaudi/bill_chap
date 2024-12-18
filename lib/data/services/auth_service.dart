import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:outer_pos_app/helpers/secure_storage.dart';
import 'package:outer_pos_app/helpers/shared_preferences.dart';

class AuthService {
  final String baseUrl = 'http://localhost:8000/api';

  final _storage = SecureStorage();

  Future<String> login(String phone, String password, String deviceName) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'phone': phone,
        'password': password,
        'device_name': deviceName,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final token = data['token'];

      await _storage.saveToken(token);
      await saveUserData(data['user']['name']);
      return 'logged';
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<String> register(String store, String name, String phone, String email,
      String password, String deviceName) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'store': store,
        'name': name,
        'phone': phone,
        'email': email,
        'password': password,
        'device_name': deviceName,
      },
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final token = data['token'];
      await _storage.saveToken(token);
      await saveUserData(data['user']['name']);
      return 'registered';
    } else {
      if (response.statusCode == 422) {
        final Map<String, dynamic> errors =
            json.decode(response.body)['errors'];

        if (errors.containsKey('email')) {
          print('Email error: ${errors['email'][0]}');
        }

        if (errors.containsKey('phone')) {
          print('Password error: ${errors['phone'][0]}');
        }
      }

      throw Exception('Failed to register');
    }
  }

  Future<void> logout() async {
    final token = await _storage.getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/logout'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      await _storage.deleteToken();
    } else {
      throw Exception('Failed to logout');
    }
  }

  Future<Map<String, dynamic>> fetchUser() async {
    final token = await _storage.getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/user'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch user');
    }
  }

  Future<bool> isLoggedIn() async {
    final token = await _storage.getToken();
    return token != null;
  }
}
