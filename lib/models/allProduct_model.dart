class AllProductModel {
  int? totalSize;
  int? offset;
  List<Products>? products;

  AllProductModel({this.totalSize, this.offset, this.products});

  AllProductModel.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    offset = json['offset'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total_size'] = this.totalSize;
    data['offset'] = this.offset;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? description;
  String? img;
  String? createdAt;
  String? updatedAt;
  String? typeId;

  Products(
      {this.id,
        this.name,
        this.description,
        this.img,
        this.createdAt,
        this.updatedAt,
        this.typeId});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['img'] = this.img;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['type_id'] = this.typeId;
    return data;
  }
}
