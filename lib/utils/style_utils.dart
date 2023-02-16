
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../constants/constants.dart';

class StyleUtils {
  static TextStyle? textStyle60() {
    return  const TextStyle(
        fontSize: textSize60,
        color: kColorBlack,
        fontFamily: fontNotoSansRegular,
        fontWeight: FontWeight.normal,
        fontFeatures: [FontFeature.proportionalFigures()]);
  }

  static TextStyle? textStyle56() {
    return   const TextStyle(
        fontSize: textSize56,
        color: kColorBlack,
        fontFamily: fontNotoSansRegular,
        fontWeight: FontWeight.normal,
        fontFeatures: [FontFeature.proportionalFigures()]);
  }

  static TextStyle? textStyle48() {
    return  const TextStyle(
        fontSize: textSize48,
        color: kColorBlack,
        fontFamily: fontNotoSansRegular,
        fontWeight: FontWeight.normal,
        fontFeatures: [FontFeature.proportionalFigures()]);
  }

  static TextStyle? textStyle40() {
    return  const TextStyle(
        fontSize: textSize40,
        color: kColorBlack,
        fontFamily: fontNotoSansRegular,
        fontWeight: FontWeight.normal,
        fontFeatures: [FontFeature.proportionalFigures()]);
  }

  static TextStyle? textStyle32() {
    return  const TextStyle(
        fontSize: textSize32,
        color: kColorBlack,
        fontFamily: fontNotoSansRegular,
        fontWeight: FontWeight.normal,
        fontFeatures: [FontFeature.proportionalFigures()]);
  }
  static TextStyle? textStyle24() {
    return  const TextStyle(
        fontSize: textSize24,
        color: kColorBlack,
        fontFamily: fontNotoSansRegular,
        fontWeight: FontWeight.normal,
        fontFeatures: [FontFeature.proportionalFigures()]);
  }
  static TextStyle? textStyle20() {
    return  const TextStyle(
        fontSize: textSize20,
        color: kColorBlack,
        fontFamily: fontNotoSansRegular,
        fontWeight: FontWeight.normal,
        fontFeatures: [FontFeature.proportionalFigures()]);
  }

  static TextStyle? textStyle16() {
    return  const TextStyle(
        fontSize: textSize16,
        color: kColorBlack,
        fontFamily: fontNotoSansRegular,
        fontWeight: FontWeight.normal,
        fontFeatures: [FontFeature.proportionalFigures()]);
  }

  static TextStyle? textStyle14() {
    return  const TextStyle(
        fontSize: textSize14,
        color: kColorBlack,
        fontFamily: fontNotoSansRegular,
        fontWeight: FontWeight.normal,
        fontFeatures: [FontFeature.proportionalFigures()]);
  }

  static TextStyle? textStyle12() {
    return  const TextStyle(
        fontSize: textSize12,
        color: kColorBlack,
        fontFamily: fontNotoSansRegular,
        fontWeight: FontWeight.normal,
        fontFeatures: [FontFeature.proportionalFigures()]);
  }
  static TextStyle? textStyleComponent({
    bool? isBold= false,
    bool? isItalic,
    double? textSize,
  }) {
    return TextStyle(
        fontSize:textSize?? textSize16,
        color: kColorBlack,
        fontFamily: isBold!? fontNotoSansBold:fontNotoSansRegular,
        fontFeatures: const [FontFeature.proportionalFigures()]);
  }
}
