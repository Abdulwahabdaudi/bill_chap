
import 'package:flutter/material.dart';
import 'package:outer_pos_app/data/models/product_model.dart';
import '../data/models/cart_item_model.dart';
//import '../data/services/api_service.dart';

class CartProvider with ChangeNotifier {
  // List<CartItem> _cartItems = [];
  // final ApiService _apiService = ApiService();

  // List<CartItem> get cartItems => _cartItems;

  // Future<void> addToCart(int productId, int quantity) async {
  //   await _apiService.post('cart/add', {'product_id': productId, 'quantity': quantity});
  //   _cartItems.add(CartItem(productId: productId, quantity: quantity));
  //   notifyListeners();
  // }

  // Future<void> fetchCart() async {
  //   final response = await _apiService.get('cart');
  //   _cartItems = (response as Map).entries
  //       .map((entry) => CartItem(productId: int.parse(entry.key), quantity: entry.value))
  //       .toList();
  //   notifyListeners();
  //}

  // Future<void> clearCart() async {
  //   await _apiService.post('cart/clear', {});
  //   _cartItems.clear();
  //   notifyListeners();
  // }




  final List<CartItem> _items = [];
  List<CartItem> get items => [..._items];

  double get total => _items.fold(
        0,
        (sum, item) => sum + item.total,
      );

  void addItem(Product product) {
    try {
      final existingIndex = _items.indexWhere(
        (item) => item.product.id == product.id,
      );

      if (existingIndex >= 0) {
        _items[existingIndex].quantity++;
      } else {
        _items.add(CartItem(product: product));
      }
      notifyListeners();
    } catch (e) {
      debugPrint('Error adding item to cart: $e');
      rethrow;
    }
  }

  void removeItem(String productId) {
    try {
      _items.removeWhere((item) => item.product.id == productId);
      notifyListeners();
    } catch (e) {
      debugPrint('Error removing item from cart: $e');
      rethrow;
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

 void incrementQuantity(String productId) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      _items[index].quantity++;
      notifyListeners();
    }
  }

  void decrementQuantity(String productId) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }




}































// import 'package:provider/provider.dart';



// class CartProvider extends ChangeNotifier {
//   final List<CartItem> _items = [];

//   List<CartItem> get items => _items;

//   double get totalAmount {
//     return _items.fold(0, (total, item) => total + (item.product.price * item.quantity));
//   }

//   void addToCart(Product product) {
//     final existingItemIndex = _items.indexWhere((item) => item.product.id == product.id);
    
//     if (existingItemIndex != -1) {
//       _items[existingItemIndex].quantity++;
//     } else {
//       _items.add(CartItem(product: product));
//     }
//     notifyListeners();
//   }

//   void removeFromCart(String productId) {
//     _items.removeWhere((item) => item.product.id == productId);
//     notifyListeners();
//   }

//   void updateQuantity(String productId, int newQuantity) {
//     final itemIndex = _items.indexWhere((item) => item.product.id == productId);
//     if (itemIndex != -1) {
//       if (newQuantity > 0) {
//         _items[itemIndex].quantity = newQuantity;
//       } else {
//         _items.removeAt(itemIndex);
//       }
//       notifyListeners();
//     }
//   }

//   void clearCart() {
//     _items.clear();
//     notifyListeners();
//   }
// }
