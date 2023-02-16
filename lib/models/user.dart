class User{
  String? username;
  String? id;
  String? name;
  String? code_role;

  User({required this.username, required this.id, required this.name, required this.code_role});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    id = json['id'];
    name = json['name'];
    code_role = json['code_role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['id'] = id;
    data['name'] = name;
    data['code_role'] = code_role;
    return data;
  }
}