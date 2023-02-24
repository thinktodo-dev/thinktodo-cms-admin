class Role {
  String? created;
  String? updated;
  String? id;
  String? code;
  String? name;
  String? description;

  Role({
      this.created,
      this.updated, 
      this.id, 
      this.code, 
      this.name, 
      this.description,});

  Role.fromJson(dynamic json) {
    created = json['created'];
    updated = json['updated'];
    id = json['id'];
    code = json['code'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['created'] = created;
    map['updated'] = updated;
    map['id'] = id;
    map['code'] = code;
    map['name'] = name;
    map['description'] = description;
    return map;
  }

}