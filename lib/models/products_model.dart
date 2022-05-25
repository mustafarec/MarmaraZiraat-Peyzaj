class Product {
  int? _totalSize, _typeId, _offset;
  late List<ProductModel> _products;
  List<ProductModel> get products => _products;

  Product(
      {required totalSize,
      required offset,
      required typeId,
      required products}) {
    _totalSize = totalSize;
    _typeId = typeId;
    _offset = offset;
    _products = products;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = json["total_size"];
    _typeId = json["type_id"];
    _offset = json["offset"];
    if (json["products"] != null) {
      _products = <ProductModel>[];
      json["products"].forEach((v) {
        _products.add(ProductModel.fromJson(v));
      });
    }
  }


}

class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price, stars, typeId;
  String? img, location, createdAt, updateAt;

  ProductModel(
      {this.typeId,
      this.id,
      this.price,
      this.name,
      this.description,
      this.createdAt,
      this.img,
      this.location,
      this.stars,
      this.updateAt});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    price = json["price"];
    stars = json["stars"];
    img = json["img"];
    location = json["location"];
    createdAt = json["createdAt"];
    updateAt = json["updateAt"];
    typeId = json["typeId"];

  }
}
