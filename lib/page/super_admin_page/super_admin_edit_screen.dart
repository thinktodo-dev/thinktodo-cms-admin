import 'package:admin/page/super_admin_page/super_admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuperAdminEditScreen extends StatelessWidget {
  final SuperAdminController superAdminController = Get.put(SuperAdminController());

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
                    controller: TextEditingController(text: superAdminController.userUpdateResource.value.username),
                    onChanged: (value) => superAdminController.userUpdateResource.value.username = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    '${superAdminController.erUsername.value}',
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
                    controller: TextEditingController(text: superAdminController.userUpdateResource.value.email),
                    onChanged: (value) => superAdminController.userUpdateResource.value.email = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    '${superAdminController.erEmail.value}',
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
                    controller: TextEditingController(text: superAdminController.userUpdateResource.value.name),
                    onChanged: (value) => superAdminController.userUpdateResource.value.name = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    '${superAdminController.erName.value}',
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
                      onPressed: superAdminController.userUpdateResource.value.id != "" ? (){
                        superAdminController.validateEdit();
                        if(superAdminController.validateFormEdit.value == true){
                          superAdminController.updateAcount();
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
