import 'package:get_storage/get_storage.dart';

import '../singleton.dart';


const String lang = "LANG";
const String authToken = "AUTH_TOKEN";


class AppSharedPrefHelper {
  static dynamic getObjectByKey(String key) {
    GetStorage box = GetStorage();
    dynamic object;
    try {
      object = box.read(key);
    } catch (e) {
      return null;
    }

    if (object == null) {
      return null;
    } else {
      return object;
    }
  }

  static setObjectByKey(dynamic object, String key) {
    GetStorage box = GetStorage();
    if (object != null) {
      box.write(key, object);
    }
  }
  static storeLang(String? language) {
    if (language != null) {
      setObjectByKey(language, lang);
    }
  }
  static String getLang() {
    if (getObjectByKey(lang) == null) {
      return "en";
    } else {
      String language = getObjectByKey(lang);
      return language;
    }
  }
  static storeAuthToken(String? token) {
    setObjectByKey(token, authToken);
    Singleton().stAuthToken = authToken;
  }
}
