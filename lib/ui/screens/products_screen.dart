import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/product_provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure ProductProvider is initialized correctly
    final productProvider = Provider.of<ProductProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: FutureBuilder(
        future: productProvider.fetchProducts(), // Fetch products when the screen loads
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading spinner while fetching data
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            // Handle error state
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          // Use Consumer to update the UI when products change
          return Consumer<ProductProvider>(
            builder: (context, provider, child) {
              if (provider.products.isEmpty) {
                return const Center(child: Text('No products available'));
              }

              // Display products in a list
              return ListView.builder(
                itemCount: provider.products.length,
                itemBuilder: (context, index) {
                  final product = provider.products[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text('Price: \$${product.sellingPrice}'),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
