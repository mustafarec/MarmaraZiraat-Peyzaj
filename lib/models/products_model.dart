import 'dart:convert';

import 'package:flutter/foundation.dart';

class Product {
  int? totalSize;
  int? typeId;
  int? offset;
  List<ProductModel> products;
  Product({
    this.totalSize,
    this.typeId,
    this.offset,
    required this.products,
  });

  Product copyWith({
    int? totalSize,
    int? typeId,
    int? offset,
    List<ProductModel>? products,
  }) {
    return Product(
      totalSize: totalSize ?? this.totalSize,
      typeId: typeId ?? this.typeId,
      offset: offset ?? this.offset,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'total_size': totalSize,
      'type_id': typeId,
      'offset': offset,
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      totalSize: map['total_size']?.toInt(),
      typeId: map['type_id']?.toInt(),
      offset: map['offset']?.toInt(),
      products: List<ProductModel>.from(
          map['products']?.map((x) => ProductModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(totalSize: $totalSize, typeId: $typeId, offset: $offset, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.totalSize == totalSize &&
        other.typeId == typeId &&
        other.offset == offset &&
        listEquals(other.products, products);
  }

  @override
  int get hashCode {
    return totalSize.hashCode ^
        typeId.hashCode ^
        offset.hashCode ^
        products.hashCode;
  }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  int? typeId;
  String? img;
  String? location;
  String? createdAt;
  String? updateAt;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stars,
    this.typeId,
    this.img,
    this.location,
    this.createdAt,
    this.updateAt,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    String? description,
    int? price,
    int? stars,
    int? typeId,
    String? img,
    String? location,
    String? createdAt,
    String? updateAt,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      stars: stars ?? this.stars,
      typeId: typeId ?? this.typeId,
      img: img ?? this.img,
      location: location ?? this.location,
      createdAt: createdAt ?? this.createdAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'stars': stars,
      'type_id': typeId,
      'img': img,
      'location': location,
      'created_at': createdAt,
      'update_at': updateAt,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt(),
      name: map['name'],
      description: map['description'],
      price: getInt(map['price']),
      stars: getInt(map['stars']),
      typeId: getInt(map['type_id']),
      img: map['img'],
      location: map['location'],
      createdAt: map['created_at'],
      updateAt: map['update_at'],
    );
  }

  static int? getInt(dynamic value) {
    if (value is int) {
      return value;
    }
    if (value is String) {
      return int.tryParse(value);
    }
    return null;
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, description: $description, price: $price, stars: $stars, typeId: $typeId, img: $img, location: $location, createdAt: $createdAt, updateAt: $updateAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.stars == stars &&
        other.typeId == typeId &&
        other.img == img &&
        other.location == location &&
        other.createdAt == createdAt &&
        other.updateAt == updateAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        stars.hashCode ^
        typeId.hashCode ^
        img.hashCode ^
        location.hashCode ^
        createdAt.hashCode ^
        updateAt.hashCode;
  }
}
