import 'dart:ui';

import 'package:admin/page/404/error.dart';
import 'package:admin/routes/app_pages.dart';
import 'package:admin/service/binding.dart';
import 'package:admin/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/gestures.dart';
import 'package:url_strategy/url_strategy.dart';
import 'constants/constants.dart';
import 'language/localization_service.dart';

void mainCommon() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp(
  //     options: const   FirebaseOptions(
  //         apiKey: "AIzaSyAAmDUD2ziWCN5Q1uIbk7fRKnJQWpRQqeE",
  //         appId: "1:1069735472931:web:3ff2dbf55b28b304b16696",
  //         messagingSenderId: "1069735472931",
  //         projectId: "taskdinodev"));
  setPathUrlStrategy();
  runApp(MyApp().main());
}

class MyApp {
  Widget main() {
    return GetMaterialApp.router(
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.green,
          brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          // for all TextWidgets.
          bodyText1: StyleUtils.textStyleComponent(textSize: textSize16),
          bodyText2: StyleUtils.textStyleComponent(textSize: textSize14),
          caption: StyleUtils.textStyleComponent(textSize: textSize12),
          headline1: StyleUtils.textStyleComponent(textSize: textSize60),
          headline2: StyleUtils.textStyleComponent(textSize: textSize56),
          headline3: StyleUtils.textStyleComponent(textSize: textSize48),
          headline4: StyleUtils.textStyleComponent(textSize: textSize40),
          headline5: StyleUtils.textStyleComponent(textSize: textSize32),
          headline6: StyleUtils.textStyleComponent(textSize: textSize24),
          headlineLarge: StyleUtils.textStyleComponent(textSize: textSize20),
        ),
      ),
      color: kColorWhite,
      title: "THINKTODO CMS",
      initialBinding: Binding(),

      unknownRoute: GetPage(
          name: '/not-found',
          page: () => const PageNotFound(),
          transition: Transition.fadeIn),
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.mouse,
      };
}
