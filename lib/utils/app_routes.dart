import 'package:flutter/material.dart';
import 'package:outer_pos_app/ui/screens/cart_screen.dart';
import 'package:outer_pos_app/ui/screens/sales_screen.dart';
import 'package:outer_pos_app/ui/screens/products_screen.dart';
import 'package:outer_pos_app/ui/screens/newscreen.dart';
import 'package:outer_pos_app/ui/screens/login_screen.dart';
import 'package:outer_pos_app/ui/screens/register_screen.dart';
import 'package:outer_pos_app/ui/screens/customers_screen.dart';
import 'package:outer_pos_app/ui/screens/land_screen.dart';
import 'package:outer_pos_app/ui/screens/scan_screen.dart';

class AppRoutes {
  static const String salesScreen = '/salesScreen';
  static const String productScreen = '/productScreen';
  static const String customerScreen = '/customerScreen';
  static const String newScreen = '/newScreen';
  static const String cartScreen = '/cartScreen';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String landScreen = '/landScreen';
  static const String loadingIndicators = '/i';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      salesScreen: (context) => const SalesScreen(),
      productScreen: (context) =>  const ProductsScreen(),
      customerScreen: (context) => const CustomersScreen(),
      newScreen: (context) => const PosHomeScreen(),
      cartScreen: (context) =>   CartScreen(),
      loginScreen: (context) => const LoginScreen(),
      registerScreen: (context) => const RegisterScreen(),
      landScreen: (context) => const LandScreen(),
    };
  }
}
