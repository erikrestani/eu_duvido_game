import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color primary = Color(0xFFE94560);
  static const Color secondary = Color(0xFF533483);
  static const Color background = Color(0xFF1A1A2E);
  static const Color surface = Color(0xFF16213E);
  static const Color surfaceLight = Color(0xFF0F3460);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.white70;
  static const Color textMuted = Colors.white54;

  // Gradients
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [surface, surfaceLight],
  );

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primary],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, secondary],
  );

  // Text Styles
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: textPrimary,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textPrimary,
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: textSecondary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: textSecondary,
  );

  static const TextStyle labelLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: textPrimary,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: primary,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: primary,
  );

  // Button Styles
  static ButtonStyle primaryButtonStyle = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(primary),
    foregroundColor: WidgetStateProperty.all(textPrimary),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    elevation: WidgetStateProperty.all(8),
  );

  static ButtonStyle secondaryButtonStyle = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(secondary),
    foregroundColor: WidgetStateProperty.all(textPrimary),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    elevation: WidgetStateProperty.all(8),
  );

  // Container Decorations
  static BoxDecoration cardDecoration = BoxDecoration(
    color: textPrimary.withValues(alpha: 0.1),
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: textPrimary.withValues(alpha: 0.2)),
  );

  static BoxDecoration primaryCardDecoration = BoxDecoration(
    color: primary.withValues(alpha: 0.2),
    borderRadius: BorderRadius.circular(15),
    border: Border.all(color: primary),
  );

  static BoxDecoration loadingCardDecoration = BoxDecoration(
    color: textPrimary.withValues(alpha: 0.1),
    borderRadius: BorderRadius.circular(15),
  );

  // Spacing
  static const double spacingXS = 8.0;
  static const double spacingS = 12.0;
  static const double spacingM = 16.0;
  static const double spacingL = 20.0;
  static const double spacingXL = 24.0;
  static const double spacingXXL = 32.0;
  static const double spacingXXXL = 40.0;

  // Border Radius
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 15.0;
  static const double radiusXL = 20.0;

  // Shadows
  static List<BoxShadow> primaryShadow = [
    BoxShadow(
      color: primary.withValues(alpha: 0.3),
      blurRadius: 10,
      offset: const Offset(0, 5),
    ),
  ];

  static List<BoxShadow> secondaryShadow = [
    BoxShadow(
      color: secondary.withValues(alpha: 0.3),
      blurRadius: 10,
      offset: const Offset(0, 5),
    ),
  ];

  // App Bar Theme
  static AppBarTheme appBarTheme = const AppBarTheme(
    backgroundColor: surface,
    foregroundColor: textPrimary,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: textPrimary,
    ),
  );

  // Scaffold Theme
  static const Color scaffoldBackgroundColor = background;

  // Icon Theme
  static const IconThemeData iconTheme = IconThemeData(
    color: primary,
    size: 24,
  );

  static const IconThemeData largeIconTheme = IconThemeData(
    color: primary,
    size: 50,
  );

  static const IconThemeData extraLargeIconTheme = IconThemeData(
    color: primary,
    size: 80,
  );
} 