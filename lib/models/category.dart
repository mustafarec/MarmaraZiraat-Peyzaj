import 'dart:convert';

import 'package:flutter/foundation.dart';

class Category {
  int id;
  String name;
  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromString(String string) {
    List<String> dizi = string.split(",");
    int id = int.parse(dizi.first);
    String name = dizi.last;
    return Category(
      id: id,
      name: name,
    );
  }

  Category copyWith({
    int? id,
    String? name,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() => 'Category(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
