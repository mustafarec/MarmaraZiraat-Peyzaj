class HastalikType {
  int? totalSize;
  List<HastaliklarTypes>? hastaliklarTypes;

  HastalikType({this.totalSize, this.hastaliklarTypes});

  HastalikType.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    if (json['hastaliklarTypes'] != null) {
      hastaliklarTypes = <HastaliklarTypes>[];
      json['hastaliklarTypes'].forEach((v) {
        hastaliklarTypes!.add(new HastaliklarTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_size'] = this.totalSize;
    if (this.hastaliklarTypes != null) {
      data['hastaliklarTypes'] =
          this.hastaliklarTypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HastaliklarTypes {
  int? id;
  String? title;
  String? parentId;
  String? createdAt;
  String? updatedAt;
  String? order;
  String? description;

  HastaliklarTypes(
      {this.id,
        this.title,
        this.parentId,
        this.createdAt,
        this.updatedAt,
        this.order,
        this.description});

  HastaliklarTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    order = json['order'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['parent_id'] = this.parentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['order'] = this.order;
    data['description'] = this.description;
    return data;
  }
}
