// lib/core/utils/media_query_utils.dart
import 'package:flutter/material.dart';

class MediaQueryUtils {
  static late BuildContext _context;
  
  static void init(BuildContext context) {
    _context = context;
  }
  
  static double get screenWidth => MediaQuery.of(_context).size.width;
  static double get screenHeight => MediaQuery.of(_context).size.height;
  static double get pixelRatio => MediaQuery.of(_context).devicePixelRatio;
  static EdgeInsets get padding => MediaQuery.of(_context).padding;
  static double get safeAreaHeight => screenHeight - padding.top - padding.bottom;
  
  static const double designWidth = 360;
  static const double designHeight = 640;
  
  static double get scaleWidth => screenWidth / designWidth;
  static double get scaleHeight => screenHeight / designHeight;
  static double get scaleText => scaleWidth < scaleHeight ? scaleWidth : scaleHeight;
  
  // Width calculation
  static double w(double width) => width * scaleWidth;
  
  // Height calculation  
  static double h(double height) => height * scaleHeight;
  
  // Radius calculation
  static double r(double radius) => radius * scaleWidth;
  
  // Font size calculation
  static double sp(double fontSize) => fontSize * scaleText;
  
  // Safe area calculations
  static double safeH(double height) => height * (safeAreaHeight / designHeight);
  
  // Percentage calculations
  static double wp(double percent) => (percent / 100) * screenWidth;
  static double hp(double percent) => (percent / 100) * screenHeight;
}