import 'package:admin/language/language_controller.dart';
import 'package:get/get.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.put<LanguageController>(LanguageController(), permanent: true);
  }
}
