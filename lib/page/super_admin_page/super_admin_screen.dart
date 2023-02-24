import 'package:admin/page/super_admin_page/super_admin_controller.dart';
import 'package:admin/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuperAdminScreen extends StatelessWidget {
  final SuperAdminController superAdminController = Get.put(SuperAdminController());
  // TabController _tabController = TabController(length: 3, vsync: this);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //       'USER MANAGEMENT',
      //     style:TextStyle(
      //       fontSize: 24,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.green,
              height: 160,
              child: Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'USER MANAGEMENT',
                      style:TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 180.0, top: 20.0),
                        child: ElevatedButton.icon(
                          onPressed: (){
                            Get.rootDelegate.toNamed(Paths.superAdminNew);
                          },
                          icon: Icon(Icons.new_label_rounded),
                          label: Text('New'),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:20.0),
                    child: Obx(() => DataTable(
                        border: TableBorder.all(),
                        columns: [
                          DataColumn(label: Text(
                              'Username',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                            ),
                          )),
                          DataColumn(label: Text(
                              'Email',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                            ),
                          )),
                          DataColumn(label: Text(
                              'Name',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                            ),
                          )),
                          DataColumn(label: Text(
                              'Role',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                            ),
                          )),
                          DataColumn(label: Text(
                              'Status',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                            ),
                          )),
                          DataColumn(label: Text('')),
                        ],
                        rows: List<DataRow>.generate(
                            superAdminController.userList.length,
                              (index) => DataRow(
                            cells: [
                              DataCell(Text(
                                  superAdminController.userList[index].username??"",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              )),
                              DataCell(Text(
                                  superAdminController.userList[index].email??"",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              )),
                              DataCell(Text(
                                  superAdminController.userList[index].name??"",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              )),
                              DataCell(Text(
                                  superAdminController.userList[index].roleCode??"",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              )),
                              DataCell(Text(
                                  superAdminController.userList[index].status??"",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              )),
                              DataCell(Row(
                                children: [
                                  ElevatedButton(
                                      onPressed: (){
                                        superAdminController.edit(index);
                                      },
                                      child: Text(
                                          'Edit',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: ElevatedButton(
                                    onPressed: (){
                                      superAdminController.deleteAccount(index);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                    ),
                                    child: Text(
                                        'Delete',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

