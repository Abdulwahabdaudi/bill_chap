
import 'package:flutter/material.dart';
import 'package:outer_pos_app/data/models/product_model.dart';

class ProductList extends StatelessWidget {
  final Function(Product) onProductSelected;

  const ProductList({
    Key? key,
    required this.onProductSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample products - replace with your data source
    final products = [
      Product(id: 1, name: 'Product 1', sellingPrice: 10.0),
      Product(id: 2, name: 'Product 2', sellingPrice: 15.0),
      Product(id: 3, name: 'Product 3', sellingPrice: 20.0),
    ];

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          title: Text(product.name),
          subtitle: Text('\$${product.sellingPrice.toStringAsFixed(2)}'),
          trailing: IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () => onProductSelected(product),
          ),
        );
      },
    );
  }
}