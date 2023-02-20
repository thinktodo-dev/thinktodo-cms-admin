import 'package:admin/service/resource/api_services.dart';
import 'package:admin/service/resource/login_resource.dart';
import 'package:http/src/response.dart';

class ServiceHelper {
  static Future<Response?> login(LoginResource resource) async {
    return await APIServices.login(resource);
  }

  static Future<Response?> verifyToken() async {
    return await APIServices.verifyToken();
  }

}