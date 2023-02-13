import 'dart:convert';

import '../service/api_response.dart';

abstract class BaseModel {}

ApiResponse parseInBackground(String bodyResponse) {
  return ApiResponse.fromJson(jsonDecode(bodyResponse));
}
