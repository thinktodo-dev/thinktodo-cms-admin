import 'package:get/get.dart';

class UserModel {
  String? id;
  String? username;
  String? password;
  String? typeAccount;
  String? email;
  String? name;
  String? status;
  String? roleCode;
  DateTime? created;
  DateTime? updated;

  UserModel({this.id, this.username, this.password, this.typeAccount, this.email, this.name, this.status , this.roleCode});

  @override
  String toString() {
    return 'UserModel{id: $id, username: $username, password: $password, typeAccount: $typeAccount, email: $email, name: $name, status: $status, roleCode: $roleCode}';
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    typeAccount = json['type_account'];
    email = json['email'];
    name = json['name'];
    status = json['status'];
    roleCode = json['role_code'];
    created = DateTime.parse(json['created']);
    updated = DateTime.parse(json['updated']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['type_account'] = typeAccount;
    data['email'] = email;
    data['name'] = name;
    data['status'] = status;
    data['role_code'] = roleCode;
    data['created'] = created.toString();
    data['updated'] = updated.toString();
    return data;
  }
}