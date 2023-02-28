import 'package:admin/page/main_page/main_controller.dart';
import 'package:admin/page/super_admin_page/user_management_controller.dart';
import 'package:admin/page/super_admin_page/user_management_edit_screen.dart';
import 'package:admin/page/super_admin_page/user_management_new_screen.dart';
import 'package:admin/page/super_admin_page/user_management_screen.dart';
import 'package:admin/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/dashboard/dashboard_screen.dart';
import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  final UserManagementController userManagementController = Get.put(UserManagementController());
  final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: mainController.scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: Obx(() => switchChild(mainController.switchPage.value)),
            ),
          ],
        ),
      ),
    );
  }
  Widget switchChild(int switchValue) {
    switch (switchValue) {
      case 1:
        return DashboardScreen();
      case 2:
        return UserManagementScreen();
      case 3:
        return UserManagementNewScreen();
      case 4:
        return UserManagementEditScreen();
      default:
        return DashboardScreen();
    }
  }
}
