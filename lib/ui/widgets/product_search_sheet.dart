import 'package:flutter/material.dart';
import 'package:outer_pos_app/data/models/product_model.dart';
import 'package:outer_pos_app/ui/widgets/product_list_item.dart';

class ProductSearchSheet extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onProductSelected;

  const ProductSearchSheet({
    Key? key,
    required this.products,
    required this.onProductSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SearchBar(
              hintText: 'Search products...',
              leading: const Icon(Icons.search),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductListItem(
                  product: product,
                  onTap: () {
                    onProductSelected(product);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
