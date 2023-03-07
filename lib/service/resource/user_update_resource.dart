class UserUpdateResource {
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

  UserUpdateResource({
    required this.id,
    required this.username,
    required this.password,
    required this.typeAccount,
    required this.email,
    required this.name,
    required this.status,
    required this.roleCode,
  });

  UserUpdateResource.fromJson(Map<String, dynamic> json) {
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
    data['username'] = username;
    data['email'] = email;
    data['name'] = name;
    data['status'] = status;
    data['role_code'] = roleCode;
    return data;
  }
}