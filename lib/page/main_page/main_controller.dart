import 'dart:convert';

import 'package:admin/service/service_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'components/dashboard/dashboard_screen.dart';

class MainController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final RxBool dardBoard = false.obs;
  final RxBool userManagement = false.obs;
  final RxInt switchPage = 0.obs;
  final RxString name = "".obs;

  @override
  void onInit(){
    super.onInit();
    this.getName();
  }

  void getName(){
    ServiceHelper.verifyToken().then((response) async {
      Map<String, dynamic> data = json.decode(response!.body);
      name.value = data['name'];
    });
  }

  // GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  // void controlMenu() {
  //   if (!_scaffoldKey.currentState!.isDrawerOpen) {
  //     _scaffoldKey.currentState!.openDrawer();
  //   }
  // }
}
