import 'package:admin/models/user.dart';
import 'package:admin/routes/app_routes.dart';
import 'package:admin/service/resource/login_resource.dart';
import 'package:admin/service/service_helper.dart';
import 'package:admin/utils/app_shared_perf_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{
  final RxString username = "".obs;
  final RxString password = "".obs;
  final RxBool isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  final loginResource = LoginResource(username: "", password: "");

  void doLogin(){
    isLoading.value = true;
      isLoading.value = false;
      if (username.value == "admin" && password.value == "admin") {
        Get.rootDelegate.toNamed(Paths.homePage);
      } else {
        // show an error if login is unsuccessful
        Get.snackbar("Error", "Incorrect username or password");
      }
  }

  String? validateUsername(String value){
    if(value.isEmpty){
      return 'Please enter username text';
    }else if(value.length < 6 || value.length> 30 ){
      return 'Please enter between 6 and 30 characters';
    }
    return null ;
  }
  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Password is required";
    }else if(value.length < 6 || value.length> 30 ){
      return 'Please enter between 6 and 30 characters';
    }
    return null;
  }
  void login(){
    loginResource.username = username.value;
    loginResource.password = password.value;
    ServiceHelper.login(loginResource).then((response) async {
  print(response?.data);
      if (response!.statusCode == 200) {
        //store token, customer id
        Map<String, dynamic> data = response['access_token'];
        print(data['access_token']);
        AppSharedPrefHelper.storeAuthToken(data['access_token']);
        // User user=User(username: username, id: id, name: name, code_role: code_role)
        //  user = new User.fromJson(response.data);
        // user = response.data;
        Get.rootDelegate.toNamed(Paths.homePage);
      } else {
        Get.snackbar("Error", "Incorrect username or password");
      }
    }, onError: (err) {
      // LogUtils.handleSystemError(err);
    });
  }
}
