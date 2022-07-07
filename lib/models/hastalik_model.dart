class Hastaliklar {
  int? totalSize;
  int? offset;
  List<Hastalik>? hastaliklar;

  Hastaliklar({this.totalSize, this.offset, this.hastaliklar});

  Hastaliklar.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    offset = json['offset'];
    if (json['hastaliklar'] != null) {
      hastaliklar = <Hastalik>[];
      json['hastaliklar'].forEach((v) {
        hastaliklar!.add(new Hastalik.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_size'] = this.totalSize;
    data['offset'] = this.offset;
    if (this.hastaliklar != null) {
      data['hastaliklar'] = this.hastaliklar!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hastalik {
  int? id;
  String? description;
  String? img;
  String? createdAt;
  String? updatedAt;
  String? typeId;

  Hastalik(
      {this.id,
        this.description,
        this.img,
        this.createdAt,
        this.updatedAt,
        this.typeId});

  Hastalik.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['img'] = this.img;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['type_id'] = this.typeId;
    return data;
  }
}