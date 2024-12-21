import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/product_provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {

final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue[700],
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              // TODO: Implement cart functionality
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search products',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                itemCount: productProvider.products.length,
                itemBuilder: (context, index) {
                  final product = productProvider.products[index];
                  return ListTile(
                title: Text(product.name),
                subtitle: Text('\$${product.name}'),
              );
                 // return _ProductCard(product: products[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class _ProductCard extends StatelessWidget {
//   final Product product;

//   const _ProductCard({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2,
//       margin: const EdgeInsets.symmetric(vertical: 4),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10.0),
//         child: ListTile(
//           leading: CircleAvatar(
//             backgroundColor: Colors.blue[100],
//             child: Text(product.name[0], style: TextStyle(color: Colors.blue[700])),
//           ),
//           title: Text(product.name, style: const TextStyle(fontSize: 14),),
//           trailing: Text(
//             '${product.price.toStringAsFixed(2)}0000000 Tsh',
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Colors.green,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
