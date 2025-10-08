// File: lib/core/utils/sizing_utils.dart
import 'package:flutter/material.dart';

class SizingUtils {
  static double dynamicWidth(double value, BuildContext context) {
    return MediaQuery.of(context).size.width * value;
  }

  static double dynamicHeight(double value, BuildContext context) {
    return MediaQuery.of(context).size.height * value;
  }

  static double dynamicFont(double value, BuildContext context) {
    return MediaQuery.of(context).size.height * value;
  }
}