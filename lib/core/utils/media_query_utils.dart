import 'package:flutter/material.dart' show BuildContext, EdgeInsets, MediaQuery, MediaQueryData;

class MediaQueryUtils {
  static late MediaQueryData _mediaQueryData;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
  }

  static double get screenWidth => _mediaQueryData.size.width;
  static double get screenHeight => _mediaQueryData.size.height;
  static double get pixelRatio => _mediaQueryData.devicePixelRatio;
  static EdgeInsets get padding => _mediaQueryData.padding;
  static double get safeAreaHeight => screenHeight - padding.top - padding.bottom;

  static const double designWidth = 360;
  static const double designHeight = 640;

  static double get scaleWidth => screenWidth / designWidth;
  static double get scaleHeight => screenHeight / designHeight;
  static double get scaleText => scaleWidth < scaleHeight ? scaleWidth : scaleHeight;

  static double w(double width) => width * scaleWidth;
  static double h(double height) => height * scaleHeight;
  static double r(double radius) => radius * scaleWidth;
  static double sp(double fontSize) => fontSize * scaleText;
  static double safeH(double height) => height * (safeAreaHeight / designHeight);

  static double wp(double percent) => (percent / 100) * screenWidth;
  static double hp(double percent) => (percent / 100) * screenHeight;
}
