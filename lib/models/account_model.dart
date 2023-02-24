import 'role.dart';

class AccountModel {
  String? created;
  String? updated;
  String? id;
  String? username;
  String? typeAccount;
  String? email;
  String? name;
  String? status;
  String? roleCode;
  Role? role;

  AccountModel({
      this.created, 
      this.updated, 
      this.id, 
      this.username, 
      this.typeAccount, 
      this.email, 
      this.name, 
      this.status, 
      this.roleCode, 
      this.role,});

  AccountModel.fromJson(dynamic json) {
    created = json['created'];
    updated = json['updated'];
    id = json['id'];
    username = json['username'];
    typeAccount = json['type_account'];
    email = json['email'];
    name = json['name'];
    status = json['status'];
    roleCode = json['role_code'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['created'] = created;
    map['updated'] = updated;
    map['id'] = id;
    map['username'] = username;
    map['type_account'] = typeAccount;
    map['email'] = email;
    map['name'] = name;
    map['status'] = status;
    map['role_code'] = roleCode;
    if (role != null) {
      map['role'] = role?.toJson();
    }
    return map;
  }

}