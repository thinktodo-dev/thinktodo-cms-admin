import 'package:admin/page/login_page/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),

        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Card(
                  elevation: 10,
                  child: Container(
                    width: 444,
                    height: 500.33,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(left: 48),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                      'Wellcom back!',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Icon(
                                        Icons.waving_hand,
                                        color: Colors.yellow,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 48,top: 5),
                          child: Text(
                              'Sign in to your account',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 46,top: 30),
                          child: Text(
                              'Username',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 46,top: 5,right: 46),
                          child: TextField(
                            onChanged: (value) => loginController.username.value = value,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 5.0,
                                  )
                              )
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 46,top: 30),
                          child: Text(
                              'Password',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 46,top: 5,right: 46),
                          child: TextField(
                            onChanged: (value) => loginController.password.value = value,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 5.0,
                                )
                              )
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 46,top: 40, right: 46),
                          child: ElevatedButton(
                              onPressed: () {
                                loginController.login();
                              },
                              child: Container(
                                width: 352,
                                height: 45,
                                child: Center(
                                  child: Text(
                                      'CONTINUE',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                            child: Center(
                              child: TextButton(
                                onPressed: (){},
                                child: Text(
                                    'For get your password?',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff625BF7),
                                  ),
                                ),
                              ),
                            ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 120,top: 30),
                width: 444,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text("Don't have an account?"),
                      ],
                    ),
                    Column(
                      children: [
                         TextButton(
                          onPressed: (){},
                          child: Text(
                              "Sign up",
                            style: TextStyle(
                              color: Color(0xff625BF7),
                          ),
                          ),
                        ),
                      ],
                     ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
