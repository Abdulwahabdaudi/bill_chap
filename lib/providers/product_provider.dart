import 'package:flutter/material.dart';
import '../data/models/product_model.dart';
import '../data/services/api_service.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  final ApiService _apiService = ApiService();

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    final response = await _apiService.get('products');
    print(response);
    _products = (response as List).map((json) => Product.fromJson(json)).toList();
    print(_products);
    notifyListeners();
  }
}
