import 'package:admin/page/main_page/main_controller.dart';
import 'package:admin/page/super_admin_page/user_management_controller.dart';
import 'package:admin/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class UserManagementNewScreen extends StatelessWidget {
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
                      'New',
                      style: Get.textTheme.titleLarge?.copyWith(color: Colors.white)
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: SizedBox(
                width: 500,
                child: Form(
                  child: Obx(() => Column(
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
                            labelText: 'Username',
                          ),
                          controller: TextEditingController(text: userManagementController.userResource.value.username),
                          onChanged: (value) => userManagementController.userResource.value.username = value,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(
                          '${userManagementController.erUsernameNew.value}',
                          style: Get.textTheme.bodyMedium?.copyWith(color: Colors.red),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: TextFormField(
                          style: Get.textTheme.bodyLarge?.copyWith(color: Colors.white),
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              icon: Icon(Icons.password),
                              hintText: 'Enter password',
                              labelText: 'Password'
                          ),
                          controller: TextEditingController(text: userManagementController.userResource.value.password),
                          onChanged: (value) => userManagementController.userResource.value.password = value,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(
                          '${userManagementController.erPasswordNew.value}',
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
                          controller: TextEditingController(text: userManagementController.userResource.value.email),
                          onChanged: (value) => userManagementController.userResource.value.email = value,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(
                          '${userManagementController.erEmailNew.value}',
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
                          controller: TextEditingController(text: userManagementController.userResource.value.name),
                          onChanged: (value) => userManagementController.userResource.value.name = value,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(
                          '${userManagementController.erNameNew.value}',
                          style: Get.textTheme.bodyMedium?.copyWith(color: Colors.red),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0,left: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 220,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: (){
                                  userManagementController.validateNew();
                                  if(userManagementController.validateFormNew.value == true){
                                    userManagementController.createAccount();
                                  }
                                },
                                child: Text(
                                    'Submit',
                                  style: Get.textTheme.headlineLarge?.copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 220,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: (){
                                  userManagementController.refreshForm();
                                },
                                child: Text(
                                    'Refresh',
                                  style: Get.textTheme.headlineLarge?.copyWith(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
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
