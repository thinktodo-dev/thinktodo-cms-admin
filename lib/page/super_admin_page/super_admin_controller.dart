import 'package:admin/models/user_model.dart';
import 'package:admin/routes/app_routes.dart';
import 'package:admin/service/resource/user_resource.dart';
import 'package:admin/service/resource/user_update_resource.dart';
import 'package:admin/service/service_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

class SuperAdminController extends GetxController with GetSingleTickerProviderStateMixin{
  final RxString erUsernameNew ="".obs;
  final RxString erPasswordNew ="".obs;
  final RxString erEmailNew ="".obs;
  final RxString erNameNew ="".obs;
  final RxString erUsername ="".obs;
  final RxString erEmail ="".obs;
  final RxString erName ="".obs;
  final RxBool validateFormNew = true.obs;
  final RxBool validateFormEdit = true.obs;
  final RxBool validateUsername = true.obs;
  final RxBool validateName = true.obs;
  final RxBool validatePassword = true.obs;
  final RxBool validateEmail = true.obs;
  final RxBool btnUpdate = false.obs;
  final userResource = UserResource(id: "", username: "", password: "", typeAccount: "email", email: "", name: "", status: "", roleCode: "").obs;
  final userUpdateResource = UserUpdateResource(id: "", username: "", password: "", typeAccount: "email", email: "", name: "", status: "", roleCode: "").obs;
  RxList<UserModel> userList = <UserModel>[].obs;
  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  late TabController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void onInit(){
    super.onInit();
    getListAccount();
    controller = TabController(length: 3, vsync: this);
  }

  void getListAccount(){
    ServiceHelper.getListAccount().then((response) async {
      Map<String, dynamic> data = json.decode(response!.body);
      List<dynamic> item = data['items'];
      item.forEach((user) {userList.value.add(UserModel.fromJson(user)); });
    });
  }

  void edit(int index){
    userUpdateResource.value = UserUpdateResource.fromJson(userList[index].toJson());
    Get.rootDelegate.toNamed(Paths.superAdminEdit);
  }

  void updateAcount(){
    ServiceHelper.updateAccount(userUpdateResource.value).then((response) async {
      if(response!.isSuccess()){
        Map<String, dynamic> data = response?.data;
        userResource.refresh();
        userList.clear();
        this.getListAccount();
        controller.animateTo(0);
        Get.snackbar("Notification", response?.message);
        this.refreshForm();
      }else{
        Get.snackbar("Notification", "Update failed");
      }
    });
  }

  void createAccount(){
    ServiceHelper.createAccount(userResource.value).then((response) async {
      if(response!.isSuccess()){
        Map<String, dynamic> data = response?.data;
        userResource.refresh();
        userList.clear();
        this.getListAccount();
        controller.animateTo(0);
        Get.snackbar("Notification", response?.message);
        this.refreshForm();
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
      roleCode: "",
    );
    userUpdateResource.value = UserUpdateResource(
      id: "",
      username: "",
      password: "",
      typeAccount: "",
      email: "",
      name: "",
      status: "",
      roleCode: "",
    );
  }

  void deleteAccount(int index){
    userResource.value = UserResource.fromJson(userList[index].toJson());
    ServiceHelper.deleteAccount(userResource.value).then((response) async {
      if(response!.isSuccess()){
        Map<String, dynamic> data = response?.data;
        userResource.refresh();
        userList.clear();
        this.getListAccount();
        controller.animateTo(0);
        Get.snackbar("Notification", response?.message);
      }else{
        Get.snackbar("Notification", "Delete failed");
      }
    });
    userList.removeAt(index);
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
  }
}