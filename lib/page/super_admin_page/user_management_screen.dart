import 'package:admin/constants/constants.dart';
import 'package:admin/page/main_page/main_controller.dart';
import 'package:admin/page/super_admin_page/user_management_controller.dart';
import 'package:admin/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserManagementScreen extends StatelessWidget {
  final UserManagementController userManagementController = Get.put(UserManagementController());
  final MainController mainController = Get.put(MainController());
  // TabController _tabController = TabController(length: 3, vsync: this);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 100,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'User Management',
                        style:Get.textTheme.titleLarge?.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 45.0),
                          child: ElevatedButton.icon(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: defaultPadding * 1.5,
                                vertical:
                                defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                              ),
                            ),
                            onPressed: (){
                              mainController.switchPage.value = 3;
                            },
                            icon: Icon(Icons.new_label_rounded),
                            label: Text(
                                'New',
                                style: Get.textTheme.bodyMedium?.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:20.0,left: 20.0, right: 20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: Color(0xFF2A2D3E),
                        child: Obx(() => DataTable(
                            columns: [
                              DataColumn(label: Text(
                                  'Username',
                                style: Get.textTheme.titleMedium?.copyWith(color: Colors.white),
                              )),
                              DataColumn(label: Text(
                                  'Email',
                                style: Get.textTheme.titleMedium?.copyWith(color: Colors.white),
                              )),
                              DataColumn(label: Text(
                                  'Name',
                                style: Get.textTheme.titleMedium?.copyWith(color: Colors.white),
                              )),
                              DataColumn(label: Text(
                                  'Role',
                                style: Get.textTheme.titleMedium?.copyWith(color: Colors.white),
                              )),
                              DataColumn(label: Text(
                                  'Status',
                                style: Get.textTheme.titleMedium?.copyWith(color: Colors.white),
                              )),
                              DataColumn(label: Text('')),
                            ],
                            rows: List<DataRow>.generate(
                              userManagementController.userList.length,
                                  (index) => DataRow(
                                cells: [
                                  DataCell(Text(
                                    userManagementController.userList[index].username??"",
                                    style: Get.textTheme.bodyLarge?.copyWith(color: Colors.white),
                                  )),
                                  DataCell(Text(
                                    userManagementController.userList[index].email??"",
                                    style: Get.textTheme.bodyLarge?.copyWith(color: Colors.white),
                                  )),
                                  DataCell(Text(
                                    userManagementController.userList[index].name??"",
                                    style: Get.textTheme.bodyLarge?.copyWith(color: Colors.white),
                                  )),
                                  DataCell(Text(
                                    userManagementController.userList[index].roleCode??"",
                                    style: Get.textTheme.bodyLarge?.copyWith(color: Colors.white),
                                  )),
                                  DataCell(Text(
                                    userManagementController.userList[index].status??"",
                                    style: Get.textTheme.bodyLarge?.copyWith(color: Colors.white),
                                  )),
                                  DataCell(Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                          onPressed: (){
                                            userManagementController.edit(index);
                                            mainController.switchPage.value = 4;
                                          },
                                          child: Text(
                                              'Edit',
                                            style: Get.textTheme.bodyMedium?.copyWith(color: Colors.white),
                                          ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: ElevatedButton(
                                        onPressed: (){
                                          userManagementController.deleteAccount(index);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.red,
                                        ),
                                        child: Text(
                                            'Delete',
                                          style: Get.textTheme.bodyMedium?.copyWith(color: Colors.white),
                                        ),
                                        ),
                                      )
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}

