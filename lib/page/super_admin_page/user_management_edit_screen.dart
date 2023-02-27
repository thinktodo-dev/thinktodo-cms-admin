import 'package:admin/page/main_page/main_controller.dart';
import 'package:admin/page/super_admin_page/user_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserManagementEditScreen extends StatelessWidget {
  final UserManagementController userManagementController = Get.put(UserManagementController());
  final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: 160,
              color: Color(0xFF2A2D3E),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0,top: 20.0),
                        child: ElevatedButton.icon(
                            onPressed: (){
                              mainController.switchPage.value = 2;
                            },
                            icon: Icon(Icons.backspace_outlined),
                            label: Text(
                                'Back',
                              style: Get.textTheme.bodyMedium?.copyWith(color: Colors.white),
                            )
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'UPDATE USER',
                      style: Get.textTheme.titleLarge?.copyWith(color: Colors.white)
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 500,
              child: Form(
                child:Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: TextFormField(
                        style: Get.textTheme.bodyLarge?.copyWith(color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            icon: Icon(Icons.person),
                            hintText: 'Enter username',
                            labelText: 'Username'
                        ),
                        controller: TextEditingController(text: userManagementController.userUpdateResource.value.username),
                        onChanged: (value) => userManagementController.userUpdateResource.value.username = value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text(
                        '${userManagementController.erUsername.value}',
                        style: Get.textTheme.bodyMedium?.copyWith(color: Colors.red),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: TextFormField(
                        style: Get.textTheme.bodyLarge?.copyWith(color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            icon: Icon(Icons.email),
                            hintText: 'Enter email',
                            labelText: 'Email'
                        ),
                        // controller: superAdminController.user.value['email'],
                        controller: TextEditingController(text: userManagementController.userUpdateResource.value.email),
                        onChanged: (value) => userManagementController.userUpdateResource.value.email = value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text(
                        '${userManagementController.erEmail.value}',
                        style: Get.textTheme.bodyMedium?.copyWith(color: Colors.red),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: TextFormField(
                        style: Get.textTheme.bodyLarge?.copyWith(color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            icon: Icon(Icons.person),
                            hintText: 'Enter name',
                            labelText: 'Name'
                        ),
                        // controller: superAdminController.user.value['name'],
                        controller: TextEditingController(text: userManagementController.userUpdateResource.value.name),
                        onChanged: (value) => userManagementController.userUpdateResource.value.name = value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text(
                        '${userManagementController.erName.value}',
                        style: Get.textTheme.bodyMedium?.copyWith(color: Colors.red),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: SizedBox(
                        width: 200,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: userManagementController.userUpdateResource.value.id != "" ? (){
                            userManagementController.validateEdit();
                            if(userManagementController.validateFormEdit.value == true){
                              userManagementController.updateAcount();
                            }
                          } : null,
                          child: Text(
                              'Update',
                            style: Get.textTheme.headlineLarge?.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
