import 'package:admin/page/super_admin_page/user_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserManagementEditScreen extends StatelessWidget {
  final UserManagementController userManagementController = Get.put(UserManagementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 500,
          child: Form(
            child:Obx(() => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                  child: TextFormField(
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
                    // controller: superAdminController.user.value['email'],
                    controller: TextEditingController(text: userManagementController.userUpdateResource.value.email),
                    onChanged: (value) => userManagementController.userUpdateResource.value.email = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    '${userManagementController.erEmail.value}',
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
                    // controller: superAdminController.user.value['name'],
                    controller: TextEditingController(text: userManagementController.userUpdateResource.value.name),
                    onChanged: (value) => userManagementController.userUpdateResource.value.name = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    '${userManagementController.erName.value}',
                    style: TextStyle(
                        color: Colors.red
                    ),
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
                      child: Text('Update'),
                    ),
                  ),
                ),
              ],
            ),
            ),
          ),
        ),
      ),
    );
  }
}
