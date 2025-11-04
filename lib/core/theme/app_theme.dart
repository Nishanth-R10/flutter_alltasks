// lib/core/theme/app_theme.dart
import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBlue = Color(0xFF4197CB);
  static const Color secondaryPurple = Color(0xFFC321DC);
  static const Color accentBlue = Color(0xFF1976D2);
  static const Color gold = Color(0xFFFFD700);
}

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryBlue,
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF5F5F5),
      foregroundColor: Colors.black,
      elevation: 0,
    ),

    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(color: Colors.black87),
      bodyMedium: TextStyle(color: Colors.black54),
    ),
    
    iconTheme: const IconThemeData(color: AppColors.primaryBlue),
    
    dividerColor: Colors.grey[300],
    
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryBlue,
      secondary: AppColors.secondaryPurple,
      surface: Colors.white,
      background: Color(0xFFF5F5F5),
      error: Colors.red,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryBlue,
    scaffoldBackgroundColor: const Color(0xFF121212),
    
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    
    cardTheme: CardThemeData(
      color: const Color(0xFF1E1E1E),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(color: Colors.white70),
      bodyMedium: TextStyle(color: Colors.white60),
    ),
    
    iconTheme: const IconThemeData(color: AppColors.primaryBlue),
    
    dividerColor: Colors.grey[700],
    
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryBlue,
      secondary: AppColors.secondaryPurple,
      surface: Color(0xFF1E1E1E),
      background: Color(0xFF121212),
      error: Colors.red,
      onSurface: Colors.white,
    ),
  );
}