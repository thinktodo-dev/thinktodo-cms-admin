import 'package:admin/constants/constants.dart';
import 'package:admin/page/main_page/main_controller.dart';
import 'package:admin/page/super_admin_page/user_management_controller.dart';
import 'package:admin/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserManagementScreen extends StatelessWidget {
  final UserManagementController userManagementController =
      Get.put(UserManagementController());
  final MainController mainController = Get.put(MainController());
  FocusNode myFocusNode = new FocusNode();


  // TabController _tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backGround,
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 40.0, top: 10.0),
                    child: Wrap(
                      children: [
                        Container(
                          height: 38,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Color(0xFFD3E6F3)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Hi, ${mainController.name.value}',
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Icon(Icons.person),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 45.0, top: 50.0),
                            child: ElevatedButton.icon(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: EdgeInsets.symmetric(
                                  horizontal: defaultPadding * 1.5,
                                  vertical: defaultPadding /
                                      (Responsive.isMobile(context) ? 2 : 1),
                                ),
                              ),
                              onPressed: () {
                                mainController.switchPage.value = 2;
                              },
                              icon: Icon(Icons.add),
                              label: Text(
                                'New',
                                style: Get.textTheme.bodyMedium?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 20.0, right: 20.0),
                        child: Container(
                            padding: EdgeInsets.all(5.0),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: kColorWhite,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                dividerColor: Colors.transparent,
                              ),
                              child: GetBuilder<UserManagementController>(
                                  id:'list',
                                  builder: (controller) =>
                                      GetBuilder<MainController>(
                                        builder: (controller1) => DataTable(
                                          // obx => getbuider
                                          dataRowHeight: 70,
                                          headingRowHeight: 96,
                                          columns: [
                                            DataColumn(
                                                label: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 16.0, bottom: 5.0),
                                                  child: Text(
                                                    'Username',
                                                    style: Get.textTheme.bodySmall
                                                        ?.copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                fontMontserrat),
                                                  ),
                                                ),
                                                Container(
                                                  width: 150,
                                                  height: 55,
                                                  padding: const EdgeInsets.only(
                                                      bottom: 16.0),
                                                  child: TextFormField(
                                                    style: TextStyle(fontSize: 13),
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.only(bottom: 4.0),
                                                      prefixIcon: Icon(
                                                          Icons.search,
                                                          color:
                                                              Color(0xFF8CA3BA)),
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xFFECEFF5),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10.0),
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                    ),
                                                    onChanged: (value) {
                                                      controller.filterByUsername(
                                                          value);
                                                    },
                                                  ),
                                                ),
                                              ],
                                            )),
                                            DataColumn(
                                                label: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 16.0, bottom: 5.0),
                                                  child: Text(
                                                    'Email',
                                                    style: Get.textTheme.bodySmall
                                                        ?.copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                fontMontserrat),
                                                  ),
                                                ),
                                                Container(
                                                  width: 150,
                                                  height: 55,
                                                  padding: const EdgeInsets.only(
                                                      bottom: 16.0),
                                                  child: TextFormField(
                                                    style: TextStyle(fontSize: 13),
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.only(bottom: 4.0),
                                                      prefixIcon: Icon(
                                                          Icons.search,
                                                          color:
                                                              Color(0xFF8CA3BA)),
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xFFECEFF5),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10.0),
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                    ),
                                                    onChanged: (value) {
                                                      controller.filterByEmail(
                                                          value);
                                                    },
                                                  ),
                                                ),
                                              ],
                                            )),
                                            DataColumn(
                                                label: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 16.0, bottom: 5.0),
                                                  child: Text(
                                                    'Name',
                                                    style: Get.textTheme.bodySmall
                                                        ?.copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                fontMontserrat),
                                                  ),
                                                ),
                                                Container(
                                                  width: 150,
                                                  height: 55,
                                                  padding: const EdgeInsets.only(
                                                      bottom: 16.0),
                                                  child: TextFormField(
                                                    // textSelectionTheme: TextSelectionThemeData( cursorColor: Colors.white),
                                                    style: TextStyle(fontSize: 13),
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.only(bottom: 4.0),
                                                      prefixIcon: Icon(
                                                          Icons.search,
                                                          color:
                                                              Color(0xFF8CA3BA)),
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xFFECEFF5),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10.0),
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                    ),
                                                    onChanged: (value) {
                                                      controller.filterByName(
                                                          value);
                                                    },
                                                  ),
                                                ),
                                              ],
                                            )),
                                            DataColumn(
                                                label: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 16.0, bottom: 5.0),
                                                  child: Text(
                                                    'Role',
                                                    style: Get.textTheme.bodySmall
                                                        ?.copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                fontMontserrat),
                                                  ),
                                                ),
                                                Container(
                                                  width: 150,
                                                  height: 40,
                                                  padding: const EdgeInsets.only(
                                                      bottom: 16.0),
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFECEFF5),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.0)),
                                                  ),
                                                  child: Obx(() => DropdownButton<String>(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10.0)),
                                                      icon: Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                top: 7.0),
                                                        child: Icon(
                                                          Icons.arrow_drop_down,
                                                          color: Color(0xFF8CA3BA),
                                                        ),
                                                      ),
                                                      underline: SizedBox(),
                                                      isExpanded: true,
                                                    value: controller.selectRole.value,
                                                    items: controller.listRoleFilter.map<DropdownMenuItem<String>>((String value) {
                                                      return DropdownMenuItem<String>(
                                                        value: value,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 10.0, top: 11.0),
                                                          child: Text(
                                                            value,
                                                            style: TextStyle(fontSize: 13),
                                                          ),
                                                        ),
                                                      );
                                                    }).toList(),
                                                    onChanged: (value){
                                                      controller.selectRole.value = value!;
                                                      controller.selectRole.refresh();
                                                      controller.filterByRole(value);
                                                    },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                            DataColumn(
                                                label: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 16.0, bottom: 5.0),
                                                  child: Text(
                                                    'Status',
                                                    style: Get.textTheme.bodySmall
                                                        ?.copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                fontMontserrat),
                                                  ),
                                                ),
                                                Container(
                                                  width: 150,
                                                  height: 40,
                                                  padding: const EdgeInsets.only(
                                                      bottom: 16.0),
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFECEFF5),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.0)),
                                                  ),
                                                  child: DropdownButton<String>(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.0)),
                                                    icon: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 7.0),
                                                      child: Icon(
                                                          Icons.arrow_drop_down,
                                                          color:
                                                              Color(0xFF8CA3BA)),
                                                    ),
                                                    underline: SizedBox(),
                                                    isExpanded: true,
                                                    value: controller.selectStatus.value,
                                                    items: controller.listStatus.map<DropdownMenuItem<String>>((String value) {
                                                      return DropdownMenuItem<String>(
                                                        value: value,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 10.0,top: 11.0),
                                                          child: Text(
                                                            value,
                                                            style: TextStyle(fontSize: 13),
                                                          ),
                                                        ),
                                                      );
                                                    }).toList(),
                                                    onChanged: (value){
                                                      controller.selectStatus.value = value!;
                                                      controller.selectStatus.refresh();
                                                      controller.filterByStatus(value);
                                                    },
                                                  ),
                                                ),
                                              ],
                                            )),
                                            DataColumn(label: Text('')),
                                          ],
                                          rows: List<DataRow>.generate(
                                            controller.userList.value.length,
                                            (index) => DataRow(
                                              // key: Key(controller.myUniqueKey),
                                              cells: [
                                                DataCell(Text(
                                                  controller.userList[index]
                                                          .username ??
                                                      "",
                                                  style: Get.textTheme.bodyMedium,
                                                )),
                                                DataCell(Text(
                                                  controller.userList[index]
                                                          .email ??
                                                      "",
                                                  style: Get.textTheme.bodyMedium,
                                                )),
                                                DataCell(Text(
                                                  controller
                                                          .userList[index].name ??
                                                      "",
                                                  style: Get.textTheme.bodyMedium,
                                                )),
                                                DataCell(Text(
                                                  controller.userList[index]
                                                          .roleCode ??
                                                      "",
                                                  style: Get.textTheme.bodyMedium,
                                                )),
                                                DataCell(Text(
                                                  controller.userList[index]
                                                          .status ??
                                                      "",
                                                  style: Get.textTheme.bodyMedium,
                                                )),
                                                DataCell(Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        controller.edit(index);
                                                        controller1
                                                            .switchPage.value = 3;
                                                      },
                                                      child: Text(
                                                        'Edit',
                                                        style: Get
                                                            .textTheme.bodyMedium
                                                            ?.copyWith(
                                                                color:
                                                                    Colors.white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                                    Colors.blue),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          controller
                                                              .deleteAccount(
                                                                  index);
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary: Colors.red,
                                                        ),
                                                        child: Text(
                                                          'Delete',
                                                          style: Get.textTheme
                                                              .bodyMedium
                                                              ?.copyWith(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
