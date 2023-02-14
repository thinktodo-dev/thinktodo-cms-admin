import 'package:flutter/material.dart';

class LogUtils{
  static log(String tag, String message) {
    debugPrint("$tag: $message");
  }
}