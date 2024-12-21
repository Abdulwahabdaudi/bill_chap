import 'package:flutter/material.dart';
import 'package:outer_pos_app/utils/app_routes.dart';
import 'package:outer_pos_app/ui/screens/land_screen.dart';
import 'package:outer_pos_app/ui/screens/login_screen.dart';
import 'package:outer_pos_app/data/services/auth_service.dart';
import 'package:provider/provider.dart';
import './providers/product_provider.dart';
import './providers/cart_provider.dart';

// // Main function to run the app
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: OuterPosApp(),
    ),
  );
}

class OuterPosApp extends StatelessWidget {
  OuterPosApp({super.key});

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bill Chap',
      home: FutureBuilder(
        future: _authService.isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
          }

          return snapshot.data == true
              ? const LandScreen() // Redirect to Home if logged in
              : const LoginScreen(); // Redirect to Login otherwise
        },
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: AppRoutes.getRoutes(),
    );
  }
}


















// // Product List Screen
// class ProductListScreen extends StatelessWidget {
//   final List<Product> products = [
//     Product(
//       id: '1',
//       name: 'Wireless Headphones',
//       price: 99.99,
//       description: 'High-quality noise-cancelling wireless headphones',
//       imageUrl: 'https://example.com/headphones.jpg'
//     ),
//     Product(
//       id: '2',
//       name: 'Smart Watch',
//       price: 199.99,
//       description: 'Advanced fitness tracking smartwatch',
//       imageUrl: 'https://example.com/smartwatch.jpg'
//     ),
//     // Add more products
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('OuterPos Products'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => CartScreen())
//               );
//             },
//           )
//         ],
//       ),
//       body: GridView.builder(
//         padding: EdgeInsets.all(10),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 0.7,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         itemCount: products.length,
//         itemBuilder: (ctx, index) {
//           final product = products[index];
//           return ProductItemCard(product: product);
//         },
//       ),
//     );
//   }
// }

// // Product Item Card Widget
// class ProductItemCard extends StatelessWidget {
//   final Product product;

//   const ProductItemCard({Key? key, required this.product}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           AspectRatio(
//             aspectRatio: 1,
//             child: Image.network(
//               product.imageUrl,
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) {
//                 return Container(color: Colors.grey);
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   product.name,
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   '\$${product.price.toStringAsFixed(2)}',
//                   style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   product.description,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: () {
//                     Provider.of<CartProvider>(context, listen: false).addToCart(product);
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('${product.name} added to cart'),
//                         duration: Duration(seconds: 2),
//                       ),
//                     );
//                   },
//                   child: Text('Add to Cart'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Cart Screen
// class CartScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Cart'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.delete),
//             onPressed: () {
//               Provider.of<CartProvider>(context, listen: false).clearCart();
//             },
//           )
//         ],
//       ),
//       body: Consumer<CartProvider>(
//         builder: (context, cartProvider, child) {
//           return cartProvider.items.isEmpty
//               ? Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.shopping_cart_outlined, size: 100, color: Colors.grey),
//                       SizedBox(height: 20),
//                       Text(
//                         'Your cart is empty',
//                         style: TextStyle(fontSize: 18, color: Colors.grey),
//                       )
//                     ],
//                   ),
//                 )
//               : Column(
//                   children: [
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: cartProvider.items.length,
//                         itemBuilder: (ctx, index) {
//                           final cartItem = cartProvider.items[index];
//                           return CartItemTile(cartItem: cartItem);
//                         },
//                       ),
//                     ),
//                     CartSummary(),
//                     CheckoutButton(),
//                   ],
//                 );
//         },
//       ),
//     );
//   }
// }

// // Cart Item Tile
// class CartItemTile extends StatelessWidget {
//   final CartItem cartItem;

//   const CartItemTile({Key? key, required this.cartItem}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Dismissible(
//       key: Key(cartItem.product.id),
//       background: Container(
//         color: Colors.red,
//         alignment: Alignment.centerRight,
//         padding: EdgeInsets.only(right: 20),
//         child: Icon(Icons.delete, color: Colors.white),
//       ),
//       direction: DismissDirection.endToStart,
//       onDismissed: (_) {
//         Provider.of<CartProvider>(context, listen: false)
//             .removeFromCart(cartItem.product.id);
//       },
//       child: ListTile(
//         leading: Image.network(
//           cartItem.product.imageUrl,
//           width: 50,
//           height: 50,
//           fit: BoxFit.cover,
//         ),
//         title: Text(cartItem.product.name),
//         subtitle: Text('\$${cartItem.product.price.toStringAsFixed(2)}'),
//         trailing: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             IconButton(
//               icon: Icon(Icons.remove_circle_outline),
//               onPressed: () {
//                 Provider.of<CartProvider>(context, listen: false)
//                     .updateQuantity(
//                         cartItem.product.id, cartItem.quantity - 1);
//               },
//             ),
//             Text('${cartItem.quantity}'),
//             IconButton(
//               icon: Icon(Icons.add_circle_outline),
//               onPressed: () {
//                 Provider.of<CartProvider>(context, listen: false)
//                     .updateQuantity(
//                         cartItem.product.id, cartItem.quantity + 1);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Cart Summary Widget
// class CartSummary extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<CartProvider>(
//       builder: (context, cartProvider, child) {
//         return Card(
//           margin: EdgeInsets.all(10),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Subtotal', style: TextStyle(fontSize: 16)),
//                     Text(
//                       '\$${cartProvider.totalAmount.toStringAsFixed(2)}',
//                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Tax (10%)', style: TextStyle(fontSize: 16)),
//                     Text(
//                       '\$${(cartProvider.totalAmount * 0.1).toStringAsFixed(2)}',
//                       style: TextStyle(fontSize: 16)
//                     ),
//                   ],
//                 ),
//                 Divider(height: 20, thickness: 1),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Total',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold
//                       )
//                     ),
//                     Text(
//                       '\$${(cartProvider.totalAmount * 1.1).toStringAsFixed(2)}',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.green
//                       )
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// // Checkout Button
// class CheckoutButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<CartProvider>(
//       builder: (context, cartProvider, child) {
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               minimumSize: Size(double.infinity, 50),
//               backgroundColor: cartProvider.items.isEmpty ? Colors.grey : Colors.blue,
//             ),
//             onPressed: cartProvider.items.isEmpty
//                 ? null
//                 : () {
//                     // Implement checkout logic
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('Checkout functionality to be implemented'),
//                         duration: Duration(seconds: 2),
//                       ),
//                     );
//                   },
//             child: Text(
//               'Proceed to Checkout',
//               style: TextStyle(fontSize: 18),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// // Main App Widget
// class OuterPosApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => CartProvider(),
//       child: MaterialApp(
//         title: 'OuterPos',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: ProductListScreen(),
//       ),
//     );
//   }
// }

