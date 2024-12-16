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
