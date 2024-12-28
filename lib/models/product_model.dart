class ProductModel {
  final dynamic id;
  final String title;
  final int price;
  final String description;

  final String images;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,

    required this.images,
  });

  factory ProductModel.fromjson(jsonData) {
    return ProductModel(
      id: jsonData["id"],
      title: jsonData["title"],
      price: jsonData["price"],
      description: jsonData["description"],
      images: jsonData['images'][0],
    );
  }
}
