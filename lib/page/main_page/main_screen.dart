import 'package:admin/page/main_page/MenuController.dart';
import 'package:admin/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/dashboard/dashboard_screen.dart';
import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
 final MenuController menuController = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: menuController.scaffoldKey,
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
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
