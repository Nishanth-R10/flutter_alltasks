// lib/core/providers/theme_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../theme/app_theme.dart';


final themeModeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.system;
});


final themeProvider = Provider<ThemeData>((ref) {
  final themeMode = ref.watch(themeModeProvider);
  
  switch (themeMode) {
    case ThemeMode.dark:
      return AppTheme.darkTheme;
    case ThemeMode.light:
      return AppTheme.lightTheme;
    case ThemeMode.system:
      final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
      return brightness == Brightness.dark ? AppTheme.darkTheme : AppTheme.lightTheme;
  }
});