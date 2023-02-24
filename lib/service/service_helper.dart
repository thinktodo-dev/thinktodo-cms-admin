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

  static Future<Response?> getListAccount() async {
    return await APIServices.getListAccount();
  }

  static Future<ApiResponse?> createAccount(UserResource resource) async {
    return await APIServices.createAccount(resource);
  }

  static Future<ApiResponse?> updateAccount(UserUpdateResource resource) async {
    return await APIServices.updateAccount(resource);
  }

  static Future<ApiResponse?> deleteAccount(UserResource resource) async {
    return await APIServices.deleteAccount(resource);
  }

}