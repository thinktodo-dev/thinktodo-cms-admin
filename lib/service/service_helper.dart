import 'package:admin/service/api_response.dart';
import 'package:admin/service/resource/api_services.dart';
import 'package:admin/service/resource/login_resource.dart';
import 'package:admin/service/resource/user_resource.dart';
import 'package:admin/service/resource/user_update_resource.dart';
import 'package:http/src/response.dart';

class ServiceHelper {
  static Future<Response?> login(LoginResource resource) async {
    return await APIServices.login(resource);
  }

  static Future<Response?> verifyToken() async {
    return await APIServices.verifyToken();
  }

  static Future<Response?> getListUser() async {
    return await APIServices.getListUser();
  }

  static Future<ApiResponse?> createUser(UserResource resource) async {
    return await APIServices.createUser(resource);
  }

  static Future<ApiResponse?> updateUser(UserUpdateResource resource) async {
    return await APIServices.updateUser(resource);
  }

  static Future<ApiResponse?> deleteUser(UserResource resource) async {
    return await APIServices.deleteUser(resource);
  }

}