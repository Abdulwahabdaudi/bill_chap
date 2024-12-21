import 'package:flutter/material.dart';
import 'package:outer_pos_app/data/models/product_model.dart';

class ProductListItem extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductListItem({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text(
        '\$${product.sellingPrice.toStringAsFixed(2)}',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.add_circle_outline),
        onPressed: onTap,
      ),
    );
  }
}