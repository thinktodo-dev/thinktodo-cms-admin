import 'package:get_storage/get_storage.dart';
import 'package:global_configs/global_configs.dart';
import 'my_app.dart';
import 'config/configurations.dart' as configurations;

void main() async {
  await GetStorage.init().then((completed) async {
    GlobalConfigs().loadFromMap(configurations.prod);
    mainCommon();
  });
}