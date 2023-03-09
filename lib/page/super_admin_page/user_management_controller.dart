import 'package:admin/models/user_model.dart';
import 'package:admin/page/main_page/main_controller.dart';
import 'package:admin/routes/app_routes.dart';
import 'package:admin/service/resource/user_resource.dart';
import 'package:admin/service/resource/user_update_resource.dart';
import 'package:admin/service/service_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

class UserManagementController extends GetxController with GetSingleTickerProviderStateMixin{
  final RxString erUsernameNew ="".obs;
  final RxString erPasswordNew ="".obs;
  final RxString erEmailNew ="".obs;
  final RxString erNameNew ="".obs;
  final RxString erUsername ="".obs;
  final RxString erEmail ="".obs;
  final RxString erName ="".obs;
  final RxString erRoleNew ="".obs;
  final RxString erRole ="".obs;
  final RxBool validateFormNew = true.obs;
  final RxBool validateFormEdit = true.obs;
  final RxBool validateUsername = true.obs;
  final RxBool validateName = true.obs;
  final RxBool validatePassword = true.obs;
  final RxBool validateEmail = true.obs;
  final RxBool validateRole = true.obs;
  final RxBool btnUpdate = false.obs;
  final userResource = UserResource(id: "", username: "", password: "", typeAccount: "email", email: "", name: "", status: "", roleCode: "Role").obs;
  final userUpdateResource = UserUpdateResource(id: "", username: "", password: "", typeAccount: "email", email: "", name: "", status: "", roleCode: "Role").obs;
  RxList<UserModel> userList = <UserModel>[].obs;
  RxList<UserModel> userTemp = <UserModel>[].obs;
  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final MainController mainController = Get.put(MainController());
  final RxString filterName = "".obs;
  final RxString filterEmail = "".obs;
  final RxString filterUsername = "".obs;
  final RxString checkRole = "".obs;
  final List<String> listRole = <String>['Role', 'admin', 'user'];
  final List<String> listRoleFilter = <String>['All','admin', 'user'];
  final List<String> listStatus = <String>['All', 'active'];
  final RxString selectRole = 'All'.obs;
  final RxString selectStatus = 'All'.obs;

  late TabController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void onInit(){
    super.onInit();
    this.verifyToken();
    this.getListAccount();
    controller = TabController(length: 3, vsync: this);
  }

  void getListAccount(){
    ServiceHelper.getListUser().then((response) async {
      Map<String, dynamic> data = json.decode(response!.body);
      List<dynamic> item;
      if(checkRole.value == 'admin'){
        item = data['items'].where((user) => user['role_code'] != 'admin' && user['role_code'] != 'super-admin').toList();
      }else{
        item = data['items'].where((user) => user['role_code'] != 'super-admin').toList();
      }
      userList.clear();
      item.forEach((user) {userList.value.add(UserModel.fromJson(user)); });
      userTemp = userList;
      update(['list']);
    });
  }

  void edit(int index){
    userUpdateResource.value = UserUpdateResource.fromJson(userList[index].toJson());
  }

  void updateAcount(){
    ServiceHelper.updateUser(userUpdateResource.value).then((response) async {
      if(response!.isSuccess()){
        Map<String, dynamic> data = response?.data;
        userResource.refresh();
        this.getListAccount();
        mainController.switchPage.value = 1;
        Get.snackbar("Notification", response?.message);
        this.refreshForm();
        update(['list']);
      }else{
        Get.snackbar("Notification", "Update failed");
      }
    });
  }

  void createAccount(){
    ServiceHelper.createUser(userResource.value).then((response) async {
      if(response!.isSuccess()){
        Map<String, dynamic> data = response?.data;
        userResource.refresh();
        this.getListAccount();
        mainController.switchPage.value = 1;
        Get.snackbar("Notification", response?.message);
        this.refreshForm();
        update(['list']);
      }else{
        Get.snackbar("Notification", "Create failed");
      }
    });
  }

  void refreshForm(){
    userResource.value = UserResource(
      id: "",
      username: "",
      password: "",
      typeAccount: "",
      email: "",
      name: "",
      status: "",
      roleCode: "Role",
    );
    userUpdateResource.value = UserUpdateResource(
      id: "",
      username: "",
      password: "",
      typeAccount: "",
      email: "",
      name: "",
      status: "",
      roleCode: "Role",
    );
  }

  void deleteAccount(int index){
    userResource.value = UserResource.fromJson(userList[index].toJson());
    ServiceHelper.deleteUser(userResource.value).then((response) async {
      if(response!.isSuccess()){
        Map<String, dynamic> data = response?.data;
        this.getListAccount();
        mainController.switchPage.value = 1;
        this.refreshForm();
        Get.snackbar("Notification", response?.message);
        update(['list']);
      }else{
        Get.snackbar("Notification", "Delete failed");
      }
    });
  }

  void validateNew(){
      if( userResource.value.username =="" ){
        erUsernameNew.value = "Please enter username";
        validateUsername.value = false;
      }else{
        erUsernameNew.value = "";
        validateUsername.value = true;
      }
      if(userResource.value.password != null && userResource.value.password != ""){
        erPasswordNew.value = "";
        validatePassword.value = true;
        if(userResource.value.password!.length! < 6 || userResource.value.password!.length! > 30){
          erPasswordNew.value = "Please enter a password between 6 and 30 characters";
          validatePassword.value = false;
        }
      } else {
        erPasswordNew.value = "Please enter password";
        validatePassword.value = false;
      }
      if( userResource.value.email =="" ){
        erEmailNew.value = "Please enter email";
        validateEmail.value = false;
      }else if(!emailRegExp.hasMatch(userResource.value.email??'')) {
        erEmailNew.value = "Please enter the correct email";
        validateEmail.value = false;
      }else{
        erEmailNew.value = "";
        validateEmail.value = true;
      }
      if( userResource.value.name =="" ){
        erNameNew.value = "Please enter name";
        validateName.value = false;
      }else{
        erNameNew.value = "";
        validateName.value = true;
      }
      if(validateName.value == true && validateEmail.value == true && validatePassword.value == true && validateUsername.value == true){
        validateFormNew.value = true;
      }else{
        validateFormNew.value = false;
      }
      if( userResource.value.roleCode =="Role" ){
        erRoleNew.value = "Please select role";
        validateRole.value = false;
      }else{
        erRoleNew.value = "";
        validateRole.value = true;
      }
  }

  void validateEdit(){
    if( userUpdateResource.value.username =="" ){
      erUsername.value = "Please enter username";
      validateUsername.value = false;
    }else{
      erUsername.value = "";
      validateUsername.value = true;
    }
    if( userUpdateResource.value.email =="" ){
      erEmail.value = "Please enter email";
      validateEmail.value = false;
    }else if(!emailRegExp.hasMatch(userUpdateResource.value.email??'')) {
      erEmail.value = "Please enter the correct email";
      validateEmail.value = false;
    }else{
      erEmail.value = "";
      validateEmail.value = true;
    }
    if( userUpdateResource.value.name =="" ){
      erName.value = "Please enter name";
      validateName.value = false;
    }else{
      erName.value = "";
      validateName.value = true;
    }
    if(validateName.value == true && validateEmail.value == true && validateUsername.value == true){
      validateFormEdit.value = true;
    }else{
      validateFormEdit.value = false;
    }
    if( userUpdateResource.value.roleCode =="Role" ){
      erRole.value = "Please select Role";
      validateRole.value = false;
    }else{
      erRole.value = "";
      validateRole.value = true;
    }
  }

  void verifyToken(){
    ServiceHelper.verifyToken().then((response) async {
      Map<String, dynamic> data = json.decode(response!.body);
        checkRole.value = data['role_code'];
        if(checkRole.value != 'super-admin'){
          listRole.removeAt(1);
          listRoleFilter.removeAt(1);
        }
    });
  }

  void filterByUsername(String username){
    List<UserModel>? result = <UserModel>[];
    if(username.isEmpty){
      result = userTemp;
    }else{
      result = userTemp.where((user) => user.username.toString().toLowerCase().contains(username.toLowerCase())).toList();
    }
    userList = RxList<UserModel>(result);
    userList.refresh();
    update(['list']);
  }

  void filterByEmail(String email){
    List<UserModel>? result = <UserModel>[];
    if(email.isEmpty){
      result = userTemp;
    }else{
      result = userTemp.where((user) => user.email.toString().toLowerCase().contains(email.toLowerCase())).toList();
    }
    userList = RxList<UserModel>(result);
    userList.refresh();
    update(['list']);
  }

  void filterByName(String name){
    List<UserModel>? result = <UserModel>[];
    if(name.isEmpty){
      result = userTemp;
    }else{
      result = userTemp.where((user) => user.name.toString().toLowerCase().contains(name.toLowerCase())).toList();
    }
    userList = RxList<UserModel>(result);
    userList.refresh();
    update(['list']);
  }

  void filterByRole(String role){
    List<UserModel>? result = <UserModel>[];
    if(role == 'All'){
      result = userTemp;
    }else{
      result = userTemp.where((user) => user.roleCode.toString().toLowerCase().contains(role.toLowerCase())).toList();
    }
    userList = RxList<UserModel>(result);
    userList.refresh();
    update(['list']);
  }

  void filterByStatus(String status){
    List<UserModel>? result = <UserModel>[];
    if(status == 'All'){
      result = userTemp;
    }else{
      result = userTemp.where((user) => user.status.toString().toLowerCase().contains(status.toLowerCase())).toList();
    }
    userList = RxList<UserModel>(result);
    userList.refresh();
    update(['list']);
  }
}