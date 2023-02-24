import 'package:admin/page/super_admin_page/super_admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuperAdminScreen extends StatelessWidget {
  final SuperAdminController superAdminController = Get.put(SuperAdminController());
  // TabController _tabController = TabController(length: 3, vsync: this);


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              'USER MANAGEMENT',
            style:TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            controller: superAdminController.controller,
            tabs: [
              Tab(
                text: 'LIST',
              ),
              Tab(
                text: 'NEW',
              ),
              Tab(
                text: 'EDIT',
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: superAdminController.controller,
          children: [
          Center(
            child: Column(
              children: [
                Obx(() => DataTable(
                    border: TableBorder.symmetric(inside: BorderSide(width: 1.0, color: Colors.grey)),
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
              ],
            ),
        ),
            Center(
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
            Center(
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
          ],
        ),
      ),
    );
  }
}

