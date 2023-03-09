import 'package:admin/constants/constants.dart';
import 'package:admin/page/main_page/main_controller.dart';
import 'package:admin/page/super_admin_page/user_management_controller.dart';
import 'package:admin/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserManagementNewScreen extends StatelessWidget {
  final UserManagementController userManagementController =
      Get.put(UserManagementController());
  final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backGround,
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 80,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                            child: IconButton(
                              onPressed: () {
                                mainController.switchPage.value = 1;
                              },
                              icon: CircleAvatar(
                                backgroundColor: backGround,
                                child: Icon(
                                  Icons.backspace_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
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
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: Icon(Icons.person),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kColorWhite,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  width: 600,
                  padding: const EdgeInsets.only(
                      left: 50.0, right: 50.0, bottom: 50.0, top: 0.0),
                  // width: 500,
                  child: Form(
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 10.0),
                            child: Text(
                              'Mandatory informations',
                              style: Get.textTheme.headlineLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 10.0),
                            child: TextFormField(
                              style: Get.textTheme.bodyLarge,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                icon: Icon(Icons.person),
                                hintText: 'Enter username',
                                labelText: 'Username',
                              ),
                              controller: TextEditingController(
                                  text: userManagementController
                                      .userResource.value.username),
                              onChanged: (value) => userManagementController
                                  .userResource.value.username = value,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                              '${userManagementController.erUsernameNew.value}',
                              style: Get.textTheme.bodyMedium
                                  ?.copyWith(color: Colors.red),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: TextFormField(
                              style: Get.textTheme.bodyLarge,
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  icon: Icon(Icons.password),
                                  hintText: 'Enter password',
                                  labelText: 'Password'),
                              controller: TextEditingController(
                                  text: userManagementController
                                      .userResource.value.password),
                              onChanged: (value) => userManagementController
                                  .userResource.value.password = value,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                              '${userManagementController.erPasswordNew.value}',
                              style: Get.textTheme.bodyMedium
                                  ?.copyWith(color: Colors.red),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: TextFormField(
                              style: Get.textTheme.bodyLarge,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  icon: Icon(Icons.email),
                                  hintText: 'Enter email',
                                  labelText: 'Email'),
                              controller: TextEditingController(
                                  text: userManagementController
                                      .userResource.value.email),
                              onChanged: (value) => userManagementController
                                  .userResource.value.email = value,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                              '${userManagementController.erEmailNew.value}',
                              style: Get.textTheme.bodyMedium
                                  ?.copyWith(color: Colors.red),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: TextFormField(
                              style: Get.textTheme.bodyLarge,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  icon: Icon(Icons.person),
                                  hintText: 'Enter name',
                                  labelText: 'Name'),
                              controller: TextEditingController(
                                  text: userManagementController
                                      .userResource.value.name),
                              onChanged: (value) => userManagementController
                                  .userResource.value.name = value,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                              '${userManagementController.erNameNew.value}',
                              style: Get.textTheme.bodyMedium
                                  ?.copyWith(color: Colors.red),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Icon(
                                    Icons.accessibility_rounded,
                                    color: Colors.grey,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 460,
                                    height: 54,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                    ),
                                    child: Obx(
                                      () => DropdownButton<String>(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10.0)),
                                        icon: Icon(Icons.arrow_drop_down),
                                        underline: SizedBox(),
                                        isExpanded: true,
                                        value: userManagementController
                                            .userResource.value.roleCode,
                                        items: userManagementController.listRole
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.only(left: 10.0),
                                              child: Text(value),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          userManagementController
                                              .userResource.value.roleCode = value;
                                          userManagementController.userResource
                                              .refresh();
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                              '${userManagementController.erRoleNew.value}',
                              style: Get.textTheme.bodyMedium
                                  ?.copyWith(color: Colors.red),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 150,
                                height: 41,
                                padding: EdgeInsets.only(right: 10.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    userManagementController.validateNew();
                                    if (userManagementController
                                            .validateFormNew.value ==
                                        true) {
                                      userManagementController.createAccount();
                                    }
                                  },
                                  child: Text(
                                    'Submit',
                                    style: Get.textTheme.bodyMedium?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                height: 41,
                                child: ElevatedButton(
                                  onPressed: () {
                                    userManagementController.refreshForm();
                                  },
                                  child: Text(
                                    'Refresh',
                                    style: Get.textTheme.bodyMedium?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
