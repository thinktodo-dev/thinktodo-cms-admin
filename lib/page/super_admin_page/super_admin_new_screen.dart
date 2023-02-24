import 'package:admin/page/super_admin_page/super_admin_controller.dart';
import 'package:admin/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SuperAdminNewScreen extends StatelessWidget {
  final SuperAdminController superAdminController = Get.put(SuperAdminController());

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
                          Get.rootDelegate.toNamed(Paths.superAdmin);
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
                          controller: TextEditingController(text: superAdminController.userResource.value.username),
                          onChanged: (value) => superAdminController.userResource.value.username = value,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(
                          '${superAdminController.erUsernameNew.value}',
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
                          controller: TextEditingController(text: superAdminController.userResource.value.password),
                          onChanged: (value) => superAdminController.userResource.value.password = value,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(
                          '${superAdminController.erPasswordNew.value}',
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
                          controller: TextEditingController(text: superAdminController.userResource.value.email),
                          onChanged: (value) => superAdminController.userResource.value.email = value,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(
                          '${superAdminController.erEmailNew.value}',
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
                          controller: TextEditingController(text: superAdminController.userResource.value.name),
                          onChanged: (value) => superAdminController.userResource.value.name = value,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(
                          '${superAdminController.erNameNew.value}',
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
                                  superAdminController.validateNew();
                                  if(superAdminController.validateFormNew.value == true){
                                    superAdminController.createAccount();
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
                                  superAdminController.refreshForm();
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
