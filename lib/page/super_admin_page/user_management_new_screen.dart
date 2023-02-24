import 'package:admin/page/super_admin_page/user_management_controller.dart';
import 'package:admin/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class UserManagementNewScreen extends StatelessWidget {
  final UserManagementController userManagementController = Get.put(UserManagementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Column(
                    children: [
                      ElevatedButton.icon(
                        onPressed: (){
                          Get.rootDelegate.toNamed(Paths.userManagement);
                        },
                        icon: Icon(Icons.backspace_outlined),
                        label: Text('Back')
                      ),
                   ]
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New',
                        style:TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: TextFormField(
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
                          style: TextStyle(
                              color: Colors.red
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: TextFormField(
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
                          style: TextStyle(
                              color: Colors.red
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: TextFormField(
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
                          style: TextStyle(
                              color: Colors.red
                          ),
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
                                child: Text('Submit'),
                              ),
                            ),
                            SizedBox(
                              width: 220,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: (){
                                  userManagementController.refreshForm();
                                },
                                child: Text('Refresh'),
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
