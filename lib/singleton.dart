

import 'package:admin/utils/app_shared_perf_helper.dart';

class Singleton {
  static final Singleton _singleton = Singleton._internal();

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();
  String? stAuthToken = AppSharedPrefHelper.getObjectByKey(authToken);

}
