import 'package:flutter/material.dart';
import 'package:outer_pos_app/screens/sales_screen.dart';
import 'package:outer_pos_app/screens/products_screen.dart';
import 'package:outer_pos_app/screens/newscreen.dart';
import 'package:outer_pos_app/screens/login_screen.dart';
import 'package:outer_pos_app/screens/register_screen.dart';
import 'package:outer_pos_app/screens/customers_screen.dart';
import 'package:outer_pos_app/screens/land_screen.dart';

class AppRoutes {
  static const String salesScreen = '/salesScreen';
  static const String productScreen = '/productScreen';
  static const String customerScreen = '/customerScreen';
  static const String newScreen = '/newScreen';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String landingScreen = '/landingScreen';
  static const String loadingIndicators = '/i';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      salesScreen: (context) => const SalesScreen(),
      productScreen: (context) =>  ProductsScreen(),
      customerScreen: (context) => const CustomersScreen(),
      newScreen: (context) => const PosHomeScreen(),
      loginScreen: (context) => const LoginScreen(),
      registerScreen: (context) => const RegisterScreen(),
      landingScreen: (context) => const LandScreen(),
    };
  }
}
