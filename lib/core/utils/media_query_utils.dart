// lib/core/utils/media_query_utils.dart
import 'package:flutter/material.dart';
class MediaQueryUtils {
  static late BuildContext _context;
  
  static void init(BuildContext context) {
    _context = context;
  }
  static double get screenWidth => MediaQuery.of(_context).size.width;
  static double get screenHeight => MediaQuery.of(_context).size.height;
  static const double designWidth = 360;
  static const double designHeight = 640;
  static double get scaleWidth => screenWidth / designWidth;
  static double get scaleHeight => screenHeight / designHeight;
  static double get scaleText => scaleWidth < scaleHeight ? scaleWidth : scaleHeight;
  static double w(double width) => width * scaleWidth;
  static double h(double height) => height * scaleHeight;
  static double r(double radius) => radius * scaleWidth;
  static double sp(double fontSize) => fontSize * scaleText;
}