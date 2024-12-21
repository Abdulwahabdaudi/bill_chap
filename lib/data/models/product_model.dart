class Product {
  final int id;
  final String name;
  // final int category;
  // final int quantity;
  // final int barcode;
  // final double buyingPrice;
   final double sellingPrice;
  // final String description;
  // final String imageUrl;

  Product({
    required this.id,
    required this.name,
    // required this.category,
    // required this.quantity,
    // required this.barcode,
    // required this.buyingPrice,
     required this.sellingPrice,
    // required this.description,
    // required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ,
      name: json['name'],
      // category: json['category_id'] ?? 0,
      // quantity: json['quantity'] ?? 0,
      // barcode: json['barcode'],
      // buyingPrice: double.parse(json['buying_price']),
       sellingPrice: double.parse(json['selling_price']),
      // description: json['description'] ?? '',
      // imageUrl: json['imageUrl'] ?? '',
    );
  }
}
