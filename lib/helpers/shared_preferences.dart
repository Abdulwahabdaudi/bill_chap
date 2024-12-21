import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserData(String name, ) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('name', name);
}

Future<Map<String, String>> getUserData() async {
  final prefs = await SharedPreferences.getInstance();
  return {
    'name': prefs.getString('name') ?? '',
  };
}

Future<void> logoutUser() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear(); // or prefs.remove('name');
}