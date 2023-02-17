import 'dart:convert';
import 'package:admin/models/base_model.dart' as base_parser;
import 'package:admin/service/http_url_service.dart';
import 'package:admin/service/resource/login_resource.dart';
import 'package:admin/utils/log_utils.dart';
import 'package:admin/utils/text_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../utils/app_shared_perf_helper.dart';
import '../api_response.dart';


class APIServices {
  static const String tag = 'APISerices';
  static final Map<String, String> baseHeaders = {
    'Content-Type': 'web/json',
    "Device-Timezone": DateTime.now().timeZoneOffset.toString(),
    // "Device-Timezone-Name": DateTime.now().timeZoneName.toString(),
    "Device-Application-Version": "1.0.0",
    "Device-Build-Number": "1",
    "X-Request-ID": DateTime.now().millisecond.toString()
  };
  static final Map<String, String> baseHeadersTasker = {
    'Content-Type': 'application/json',
    "Device-Timezone": DateTime.now().timeZoneOffset.toString(),
    // "Device-Timezone-Name": DateTime.now().timeZoneName,
    // "Device-OS-Version": Platform.operatingSystemVersion,
    // "Device-OS": Platform.isIOS
    //     ? "iOS"
    //     : Platform.isAndroid
    //         ? "Android"
    //         : Platform.isWindows
    //             ? "Windows"
    //             : Platform.isMacOS
    //                 ? "MacOS"
    //                 : "Other",
    "Device-Application-Version": "1.0.0",
    "Device-Build-Number": "1",
    "TaskDino-Role-App": "customer",
    "X-Request-ID": DateTime.now().millisecond.toString()
  };

  static Future<Map<String, String>> _modifyHeadersTasker() async {
    Map<String, String> headers = await _baseHeadersTasker();
    String? loginToken = AppSharedPrefHelper.getObjectByKey(authToken);
    if (loginToken != null) {
      if (!TextUtils.isEmpty(loginToken)) {
        headers['Authorization'] = "Bearer $loginToken";
      }
    }

    bool isEnableLogHeader = true;
    if (isEnableLogHeader) {
      LogUtils.log(tag, 'start logging request header');
      headers.forEach((key, value) {
        LogUtils.log(tag, 'key: $key, value: $value');
      });
    }
    return headers;
  }

  // static Future<Map<String, String>> _modifyHeaders() async {
  //   Map<String, String> headers = await _baseHeaders();
  //   bool isEnableLogHeader = true;
  //   if (isEnableLogHeader) {
  //     LogUtils.log("_TAG", 'start logging request header');
  //     headers.forEach((key, value) {
  //       LogUtils.log("_TAG", 'key: $key, value: $value');
  //     });
  //   }
  //   return headers;
  // }

  static Future<Map<String, String>> _modifyHeaders() async {
    Map<String, String> headers = await _baseHeaders();

    String? loginToken = AppSharedPrefHelper.getObjectByKey(authToken);
    if (loginToken != null) {
      headers['Authorization'] = "Bearer $loginToken";
      bool isEnableLogHeader = true;
      if (isEnableLogHeader) {
        LogUtils.log(tag, 'start logging request header');
        headers.forEach((key, value) {
          LogUtils.log(tag, 'key: $key, value: $value');
        });
      }
    }
    return headers;
  }

  static Future<ApiResponse?> _callGetAPI(
      {required String httpUrl, String? param = ''}) async {
    httpUrl += param != '' ? '$param' : '';
    var url = Uri.parse(httpUrl);
    Map<String, String> headers = await _modifyHeaders();
    LogUtils.log("_TAG", 'HttpURL: $httpUrl');
    LogUtils.log("_TAG", 'Headers: $headers');
    final response = await http.get(url, headers: headers);
    _logResponseBody(response.body, httpUrl);
    ApiResponse? apiResponse =
        await compute(base_parser.parseInBackground, response.body);
    return apiResponse;
  }

  static Future<ApiResponse?> _callPostAPITasker(
      String httpUrl, String jsonBody) async {
    var url = Uri.parse(httpUrl);
    Map<String, String> headers = await _modifyHeadersTasker();

    LogUtils.log("_TAG", 'HttpURL: $httpUrl');
    LogUtils.log("_TAG", 'JSON Body: $jsonBody');
    LogUtils.log("_TAG", 'Headers: $headers');
    final response = await http.post(url, headers: headers, body: jsonBody);
    _logResponseBody(response.body, httpUrl);
    ApiResponse? apiResponse =
        await compute(base_parser.parseInBackground, response.body);
    return apiResponse;
  }

  static Future<ApiResponse?> _callDeleteAPI(
      {required String httpUrl, String? param = ''}) async {
    httpUrl += param != '' ? '$param' : '';
    var url = Uri.parse(httpUrl);
    Map<String, String> headers = await _modifyHeaders();
    LogUtils.log("_TAG", 'HttpURL: $httpUrl');
    LogUtils.log("_TAG", 'Headers: $headers');
    final response = await http.delete(url, headers: headers);
    _logResponseBody(response.body, httpUrl);
    ApiResponse? apiResponse =
        await compute(base_parser.parseInBackground, response.body);
    return apiResponse;
  }

  static Future<ApiResponse?> _callPostAPI(
      String httpUrl, String jsonBody) async {
    var url = Uri.parse(httpUrl);
    Map<String, String> headers = await _modifyHeaders();
    LogUtils.log("_TAG", 'HttpURL: $httpUrl');
    LogUtils.log("_TAG", 'JSON Body: $jsonBody');
    LogUtils.log("_TAG", 'Headers: $headers');
    final response = await http.post(url, headers: headers, body: jsonBody);
    _logResponseBody(response.body, httpUrl);
    ApiResponse? apiResponse =
        await compute(base_parser.parseInBackground, response.body);
    return apiResponse;
  }

  static Future<http.Response> _callLoginPostAPI(
      String httpUrl, String jsonBody) async {
    var url = Uri.parse(httpUrl);
    Map<String, String> headers = await _modifyHeaders();
    LogUtils.log("_TAG", 'HttpURL: $httpUrl');
    LogUtils.log("_TAG", 'JSON Body: $jsonBody');
    LogUtils.log("_TAG", 'Headers: $headers');
    final response = await http.post(url, headers: headers, body: jsonBody);
    return response;
  }

  static Future<ApiResponse?> _callPutAPI(
      String httpUrl, String jsonBody) async {
    var url = Uri.parse(httpUrl);
    Map<String, String> headers = await _modifyHeaders();
    LogUtils.log(tag, 'HttpURL: $httpUrl');
    LogUtils.log(tag, 'JSON Body: $jsonBody');
    LogUtils.log(tag, 'Headers: $headers');
    final response = await http.put(url, headers: headers, body: jsonBody);
    _logResponseBody(response.body, httpUrl);
    ApiResponse? apiResponse =
        await compute(base_parser.parseInBackground, response.body);
    return apiResponse;
  }

  static Future<ApiResponse?> _callPutAPIWithParam(
      String httpUrl, String jsonBody, String? param) async {
    httpUrl += param != '' ? '/$param' : '';
    var url = Uri.parse(httpUrl);
    Map<String, String> headers = await _modifyHeaders();
    LogUtils.log(tag, 'HttpURL: $httpUrl');
    LogUtils.log(tag, 'JSON Body: $jsonBody');
    LogUtils.log(tag, 'Headers: $headers');
    final response = await http.put(url, headers: headers, body: jsonBody);
    _logResponseBody(response.body, httpUrl);
    ApiResponse? apiResponse =
        await compute(base_parser.parseInBackground, response.body);
    return apiResponse;
  }

  static Future<ApiResponse?> _callFormDataAPI(
      String httpUrl,
      List<dynamic> listFile,
      String path,
      String field,
      List<dynamic> listFileByte) async {
    var url = Uri.parse(httpUrl);
    Map<String, String> headers = await _modifyHeaders();
    headers['Content-Type'] = 'multipart/form-data';
    var request = http.MultipartRequest("POST", url);
    request.headers.addAll(headers);
    request.fields['path'] = path;
    if (listFile.isNotEmpty) {
      for (var file in listFile) {
        // if (lookupMimeType(file.path)!.split("/").first == "image") {
        final length = await file.length();
        request.files.add(http.MultipartFile(
            field, file.readAsBytes().asStream(), length,
            contentType: MediaType('image', file.mimeType ?? 'png'),
            filename: file.path.split("/").last));
        // } else {}
      }
    } else {
      for (var file in listFileByte) {
        // if (lookupMimeType(file.path)!.split("/").first == "image") {
        final length = file.bytes!.length;
        final result1 = Stream.value(
          List<int>.from(file.bytes!),
        );

        request.files.add(http.MultipartFile(field, result1, length,
            contentType: MediaType('file', file.extension.toString()),
            filename: file.fileName));
        // } else {}
      }
    }
    var streamedResponse = await request.send();

    LogUtils.log(tag, 'HttpURL: $httpUrl');
    LogUtils.log(tag, 'Headers: $headers');
    LogUtils.log(tag, 'Request: $request');
    var response = await http.Response.fromStream(streamedResponse);
    _logResponseBody(response.body, httpUrl);
    ApiResponse? apiResponse =
        await compute(base_parser.parseInBackground, response.body);
    return apiResponse;
  }

  static void _logResponseBody(String responseBody, String apiURL) {
    LogUtils.log("_TAG", 'Response for API: $apiURL:\n$responseBody');
  }

  // static Future<Map<String, String>> _baseHeaders() async {
  //   Map<String, String> headers = baseHeaders;
  //   headers['Content-Type'] = 'application/json';
  //   return headers;
  // }
  static Future<Map<String, String>> _baseHeaders() async {
    Map<String, String> headers = baseHeaders;
    headers['Content-Type'] = 'application/json';
    return headers;
  }



  static Future<Map<String, String>> _baseHeadersTasker() async {
    Map<String, String> headers = baseHeadersTasker;
    headers['Content-Type'] = 'application/json';
    return headers;
  }

  static Future<http.Response?> login(LoginResource resource) async {
    return await _callLoginPostAPI(
        HttpUrlService.login, jsonEncode(resource));
  }
}
