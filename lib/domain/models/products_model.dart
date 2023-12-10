class ProductsModel {
  final int id;
  final String title;
  final String price;
  final String description;
  final String image;

  ProductsModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image});

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
        id: json['id']as int,
        title: json['title'],
        price: json['price'].toString(),
        description: json['description'],
        image: json['image']);
  }
}
