class Product {
  final int id;
  final String name;
  final String category;
  final int quantity;
  final int barcode;
  final double buyingPrice;
  final double sellingPrice;
  final String description;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.quantity,
    required this.barcode,
    required this.buyingPrice,
    required this.sellingPrice,
    required this.description,
    required this.imageUrl,
  });


factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      category: json['category_id'],
      quantity: json['quantity'],
      barcode: json['barcode'],
      buyingPrice: json['buying_price'].toDouble(),
      sellingPrice: json['selling_price'].toDouble(),
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }

}
