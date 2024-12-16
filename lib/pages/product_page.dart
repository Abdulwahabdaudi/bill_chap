import 'package:flutter/material.dart';

// Product model
class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

// Sample product data
final List<Product> sampleProducts = [
  Product(
    id: '1',
    name: 'Minimalist Watch',
    description: 'Elegant timepiece with sleek design',
    price: 199.99,
    imageUrl: 'https://example.com/watch.jpg',
  ),
  Product(
    id: '2',
    name: 'Leather Backpack',
    description: 'Durable and stylish everyday backpack',
    price: 149.50,
    imageUrl: 'https://example.com/backpack.jpg',
  ),
  Product(
    id: '3',
    name: 'Wireless Earbuds',
    description: 'Noise-cancelling premium earbuds',
    price: 249.99,
    imageUrl: 'https://example.com/earbuds.jpg',
  ),
];

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                itemCount: sampleProducts.length,
                itemBuilder: (context, index) {
                  return _ProductCard(product: sampleProducts[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue[100],
            child: Text(product.name[0], style: TextStyle(color: Colors.blue[700])),
          ),
          title: Text(product.name, style: const TextStyle(fontSize: 14),),
          trailing: Text(
            '${product.price.toStringAsFixed(2)}0000000 Tsh',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
