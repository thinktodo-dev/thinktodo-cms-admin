import 'package:admin/routes/app_routes.dart';
import 'package:admin/service/service_helper.dart';
import 'package:get/get.dart';

import 'dart:convert';

class SplashController extends GetxController{
  @override
  void onInit(){
    super.onInit();
    verifyToken();
  }

  void verifyToken(){
    ServiceHelper.verifyToken().then((response) async {
      Map<String, dynamic> data = json.decode(response!.body);
      if(data['role_code'] == 'admin' || data['role_code'] == 'super_admin'){
        Get.rootDelegate.toNamed(Paths.homePage);
      }else{
        Get.rootDelegate.toNamed(Paths.login);
      }
    });
  }
}