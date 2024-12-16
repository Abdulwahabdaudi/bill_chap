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
}
