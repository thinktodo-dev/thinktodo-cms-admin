import 'package:admin/routes/app_routes.dart';
import 'package:admin/service/resource/login_resource.dart';
import 'package:admin/service/service_helper.dart';
import 'package:admin/utils/app_shared_perf_helper.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginController extends GetxController{
  final RxString username = "".obs;
  final RxString password = "".obs;
  final RxBool isLoading = false.obs;
  final loginResource = LoginResource(username: "", password: "");
  final RxString erUsername = "".obs;
  final RxBool erValidateUsername = true.obs;
  final RxString erPassword = "".obs;
  final RxBool erValidatePassword = true.obs;


  void validateUsername(){
    if(username.value == "" || username.value.isEmpty){
      erUsername.value = "Please enter username";
      erValidateUsername.value = false;
    } else{
      erUsername.value = "";
      erValidateUsername.value = true;
    }
  }

  void validatePassword(){
    if(password.value == "" || password.value.isEmpty){
      erPassword.value = "Please enter password";
      erValidatePassword.value = false;
    } else if(password.value.length <6 || password.value.length >30){
      erPassword.value = "Please enter a password between 6 and 30 characters";
      erValidatePassword.value = false;
    }else{
      erPassword.value = "";
      erValidatePassword.value = true;
    }
  }

  void login(){
    loginResource.username = username.value;
    loginResource.password = password.value;
    ServiceHelper.login(loginResource).then((response) async {
      if (response?.statusCode == 201) {
        String? data = response?.body;
        Map<String, dynamic> payload = JwtDecoder.decode(data!);
        AppSharedPrefHelper.storeAuthToken(data);
        if(payload['role_code']  == "admin" || payload['role_code'] == "super-admin"){
          Get.rootDelegate.toNamed(Paths.homePage);
        }else{
          Get.snackbar("Notification", "You don't have access");
        }
      } else {
        Get.snackbar("Error", "Incorrect username or password");
      }
    }, onError: (err) {
      // LogUtils.handleSystemError(err);
    });
  }
}
