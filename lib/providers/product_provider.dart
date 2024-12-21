import 'package:flutter/material.dart';
import '../data/models/product_model.dart';
import '../data/services/api_service.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  final ApiService _apiService = ApiService();

  List<Product> get products => _products;

   Future<void> fetchProducts() async {
     final response = await _apiService.get('products');
     _products = (response as List).map((json) => Product.fromJson(json)).toList();
   //  print('Parsed Products: $_products');
     notifyListeners();
    // print('notifyListeners called');
   }


// Future<void> fetchProducts() async {
//   final response = await _apiService.get('products');
//   print('Raw Response: $response');

//   try {
//     if (response is List) {
//       _products = response.map((item) {
//         print('Parsing item: $item');
//         return Product.fromJson(item);
//       }).toList();
//     } else {
//       print('Response is not a List');
//     }
//   } catch (e) {
//     print('Error parsing products: $e');
//   }

//   print('Parsed Products: $_products');
//   notifyListeners();
// }





}
