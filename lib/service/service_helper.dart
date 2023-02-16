

import 'package:admin/service/api_response.dart';
import 'package:admin/service/resource/api_services.dart';
import 'package:admin/service/resource/login_resource.dart';

class ServiceHelper {
  static Future<ApiResponse?> login(LoginResource resource) async {
    return await APIServices.login(resource);
  }

}
