import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_shared_perf_helper.dart';
import 'localization_service.dart';

enum SingingCharacter { vi, en }

class LanguageController extends GetxController {
  Rx<SingingCharacter>? character = AppSharedPrefHelper.getLang() == "vi"
      ? SingingCharacter.vi.obs
      : SingingCharacter.en.obs;
  RxBool checkLanguage = true.obs;
  String selectedLang = LocalizationService.locale!.languageCode;
  setLanguage(String lang) {
    selectedLang = lang;
    LocalizationService.changeLocale(lang);
    AppSharedPrefHelper.storeLang(lang);
    if (lang == "vi") {
      checkLanguage.value = true;
    } else {
      checkLanguage.value = false;
    }
  }

  @override
  void onInit() {
    String lang = AppSharedPrefHelper.getLang();
    if (lang == "vi") {
      checkLanguage.value = true;
      Future.delayed(const Duration(milliseconds: 200), () {
        LocalizationService.changeLocale('vi');
      });
    } else {
      checkLanguage.value = false;
      Future.delayed(const Duration(milliseconds: 200), () {
        LocalizationService.changeLocale('en');
      });
    }
    super.onInit();
    dropdownTestItems = buildDropdownTestItems(listLang);
  }

  List<DropdownMenuItem<Object?>> dropdownTestItems = [];

  onChangeDropdownTests(selectedTest) {
    selectedValue.value = selectedTest;
    if (AppSharedPrefHelper.getLang() == "vi") {
      setLanguage("en");
    } else {
      setLanguage("vi");
    }
  }

  List<String> listLang = ["vi".tr, "en".tr];
  RxString selectedValue = "en".tr.obs;

  List<DropdownMenuItem<String?>> buildDropdownTestItems(List item) {
    List<DropdownMenuItem<String?>> items = [];
    for (int i = 0; i < listLang.length; i++) {
      items.add(
        DropdownMenuItem(
          value: item[i].toString().tr,
          child: Text(item[i].toString().tr),
        ),
      );
    }
    return items;
  }
}
