import 'package:flutter/material.dart';

class AppConstants {
  // App-wide strings
  static const String appName = 'Outerpos';
  static const String welcomeMessage = 'Welcome to Outerpos!';
  static const String errorMessage = 'Something went wrong. Please try again.';

  // API Endpoints
  static const String baseUrl = 'http://localhost:8000/api';
  static const String loginEndpoint = '$baseUrl/login';
  static const String registerEndpoint = '$baseUrl/register';

  // Default padding and margins
  static const double defaultPadding = 16.0;
  static const double defaultMargin = 16.0;

  // Colors
  static const Color primaryColor = Colors.blue;
  static const Color secondaryColor = Colors.orange;
  static const Color backgroundColor = Colors.white;
}
