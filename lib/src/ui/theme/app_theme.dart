import 'package:flutter/material.dart';

class AppTheme {
  // 颜色常量
  static const Color _primaryLightColor = Color(0xFF2196F3); // 浅色主题主色
  static const Color _primaryDarkColor = Color(0xFF1976D2); // 深色主题主色

  static const Color _secondaryLightColor = Color(0xFF4CAF50);
  static const Color _secondaryDarkColor = Color(0xFF388E3C);

  // 自定义颜色
  static const Color _fileItemBgLight = Color(0xFFF5F5F5);
  static const Color _fileItemBgDark = Color(0xFF2C2C2C);

  // 文字颜色
  static const Color _textPrimaryLight = Color(0xFF212121);
  static const Color _textPrimaryDark = Color(0xFFE0E0E0);
  static const Color _textSecondaryLight = Color(0xFF757575);
  static const Color _textSecondaryDark = Color(0xFF9E9E9E);

  // 获取主题数据
  static ThemeData getLightTheme() {
    return ThemeData(
      useMaterial3: true, // 使用 Material 3
      brightness: Brightness.light,
      primaryColor: _primaryLightColor,

      // 颜色方案
      colorScheme: ColorScheme.light(
        primary: _primaryLightColor,
        secondary: _secondaryLightColor,
        surface: Colors.white,
        error: Colors.red[700]!,
      ),

      // 应用栏主题
      appBarTheme: const AppBarTheme(
        backgroundColor: _primaryLightColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      // 卡片主题
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      // 文本主题
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          color: _textPrimaryLight,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: _textPrimaryLight,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: _textSecondaryLight,
          fontSize: 14,
        ),
      ),

      // 图标主题
      iconTheme: const IconThemeData(
        color: _primaryLightColor,
        size: 24,
      ),

      // 输入框装饰
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: _primaryDarkColor,

      // 深色模式颜色方案
      colorScheme: ColorScheme.dark(
        primary: _primaryDarkColor,
        secondary: _secondaryDarkColor,
        surface: const Color(0xFF1E1E1E),
        error: Colors.red[300]!,
      ),

      // 深色应用栏主题
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1E1E1E),
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      // 深色卡片主题
      cardTheme: CardTheme(
        color: const Color(0xFF2C2C2C),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      // 深色文本主题
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          color: _textPrimaryDark,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: _textPrimaryDark,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: _textSecondaryDark,
          fontSize: 14,
        ),
      ),

      // 深色图标主题
      iconTheme: const IconThemeData(
        color: Colors.white70,
        size: 24,
      ),

      // 深色输入框装饰
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF2C2C2C),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // 自定义主题颜色
  static CustomColors getLightCustomColors() {
    return CustomColors(
      fileItemBackground: _fileItemBgLight,
      folderIconColor: Colors.amber[700]!,
      progressBarBackground: Colors.grey[200]!,
      dividerColor: Colors.grey[300]!,
    );
  }

  static CustomColors getDarkCustomColors() {
    return CustomColors(
      fileItemBackground: _fileItemBgDark,
      folderIconColor: Colors.amber[500]!,
      progressBarBackground: Colors.grey[800]!,
      dividerColor: Colors.grey[800]!,
    );
  }
}

// 自定义颜色类
class CustomColors {
  final Color fileItemBackground;
  final Color folderIconColor;
  final Color progressBarBackground;
  final Color dividerColor;

  CustomColors({
    required this.fileItemBackground,
    required this.folderIconColor,
    required this.progressBarBackground,
    required this.dividerColor,
  });
}
