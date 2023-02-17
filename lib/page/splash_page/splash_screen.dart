import 'package:admin/page/splash_page/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset("images/odet8_logoWhite.png")
                ],
              ),
              Column(
                children: [
                  Text(
                    'CMS THINKTODO',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50
                    ),
                  ),
                  new CircularProgressIndicator(
                    value: null,
                    strokeWidth: 7.0,
                    color: Colors.red,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
