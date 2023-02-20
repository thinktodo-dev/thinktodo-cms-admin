import 'package:admin/page/login_page/login_screen.dart';
import 'package:admin/page/main_page/main_screen.dart';
import 'package:admin/page/splash_page/splash_screen.dart';
import 'package:admin/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages{
  static Transition transition = Transition.fadeIn;
  static final routes = [
    GetPage(name:Paths.splashPage, page: ()=> SplashScreen()),
    GetPage(name:Paths.login, page: ()=> LoginScreen()),
    GetPage(name:Paths.homePage, page: ()=> MainScreen())
  ];
}