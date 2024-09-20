import 'package:flutter/material.dart';

// Define your custom PageTransitionsTheme
final PageTransitionsTheme pageTransitionsTheme = const PageTransitionsTheme(
  builders: <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  },
);

// Light theme
ThemeData light([Color? targetColor]) {
  final _colors = colors(Brightness.light, targetColor);
  return ThemeData.light().copyWith(
    pageTransitionsTheme: pageTransitionsTheme,
    colorScheme: ColorScheme.fromSeed(
      seedColor: source(targetColor),
      brightness: Brightness.light,
      onSurface: Colors.blueGrey,
    ),
    scaffoldBackgroundColor: const Color(0xFFE5E5E5),
    appBarTheme: AppBarTheme(
      color: _colors.primary,
      iconTheme: IconThemeData(color: _colors.onPrimary),
      titleTextStyle: TextStyle(
        color: _colors.onPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        shadows: [
          Shadow(
            blurRadius: 10.0,
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(2.0, 2.0),
          ),
        ],
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.blueGrey[900], // Global icon color
    ),
    textTheme: ThemeData.light().textTheme.copyWith(
      displayLarge: TextStyle(
          fontFamily: 'Nunito',
          color: _colors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 32),
      headlineLarge: TextStyle(
          fontFamily: 'Nunito',
          color: _colors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 24),
      titleLarge: TextStyle(
          fontFamily: 'Nunito',
          color: _colors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 20),
      titleMedium: TextStyle(
          fontFamily: 'Nunito',
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold,
          fontSize: 18),
      bodyLarge: TextStyle(
          fontFamily: 'Nunito', color: _colors.onSurface, fontSize: 18),
      bodyMedium: TextStyle(
          fontFamily: 'Nunito', color: _colors.onSurface, fontSize: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFB0B0B0), // Light gray
        foregroundColor: const Color(0xFFFFFFFF), // White text
        elevation: 8.0,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle: const TextStyle(
          fontFamily: 'Nunito',
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    ),
  );
}
// Pastel theme
ThemeData pastelTheme([Color? targetColor]) {
  final _colors = colors(Brightness.light, targetColor);
  return ThemeData.light().copyWith(
    pageTransitionsTheme: pageTransitionsTheme,
    colorScheme: ColorScheme.fromSeed(
      seedColor: source(targetColor),
      brightness: Brightness.light,
      onSurface: Colors.blueGrey,
    ),
    scaffoldBackgroundColor: Color(0xFFFFE0E0), // Light pastel background
    appBarTheme: AppBarTheme(
      color: Color(0xFFFFE0E0),
      iconTheme: IconThemeData(color: _colors.onPrimary),
      titleTextStyle: TextStyle(
        color: _colors.onPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        shadows: [
          Shadow(
            blurRadius: 10.0,
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(2.0, 2.0),
          ),
        ],
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.blueGrey[900], // Global icon color
    ),
    textTheme: ThemeData.light().textTheme.copyWith(
      displayLarge: TextStyle(
          fontFamily: 'Nunito',
          color: _colors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 32),
      headlineLarge: TextStyle(
          fontFamily: 'Nunito',
          color: _colors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 24),
      titleLarge: TextStyle(
          fontFamily: 'Nunito',
          color: _colors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 20),
      titleMedium: TextStyle(
          fontFamily: 'Nunito',
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold,
          fontSize: 18),
      bodyLarge: TextStyle(
          fontFamily: 'Nunito', color: _colors.onSurface, fontSize: 18),
      bodyMedium: TextStyle(
          fontFamily: 'Nunito', color: _colors.onSurface, fontSize: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFFA07A), // Light pastel button
        foregroundColor: Colors.white, // White text
        elevation: 8.0,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle: const TextStyle(
          fontFamily: 'Nunito',
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    ),
  );
}
// Dark theme
// Dark theme
ThemeData dark([Color? targetColor]) {
  final _colors = colors(Brightness.dark, targetColor);
  return ThemeData.dark().copyWith(
    pageTransitionsTheme: pageTransitionsTheme,
    colorScheme: ColorScheme.fromSeed(
      seedColor: source(targetColor),
      brightness: Brightness.dark,
      primary: _colors.primary,
      onPrimary: Colors.white,
      surface: Colors.grey[850]!, // Darker surface color for better contrast
      onSurface: Colors.white,
      secondary: Colors.tealAccent,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.black87,
    appBarTheme: AppBarTheme(
      color: Colors.black.withOpacity(0.8), // Slightly transparent for depth
      iconTheme: IconThemeData(color: _colors.onPrimary),
      titleTextStyle: TextStyle(
        color: _colors.onPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        shadows: [
          Shadow(
            blurRadius: 10.0,
            color: Colors.black.withOpacity(0.7), // Darker shadow for contrast
            offset: const Offset(2.0, 2.0),
          ),
        ],
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.white, // Global icon color
    ),
    textTheme: ThemeData.dark().textTheme.copyWith(
      displayLarge: TextStyle(
          fontFamily: 'Nunito',
          color: _colors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 32),
      headlineLarge: TextStyle(
          fontFamily: 'Nunito',
          color: _colors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 24),
      titleLarge: TextStyle(
          fontFamily: 'Nunito',
          color: _colors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 20),
      titleMedium: TextStyle(
          fontFamily: 'Nunito',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18),
      bodyLarge: TextStyle(
          fontFamily: 'Nunito', color: Colors.white70, fontSize: 18),
      bodyMedium: TextStyle(
          fontFamily: 'Nunito', color: Colors.white54, fontSize: 16), // Slightly lighter
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF1B1B1B), // Dark gray
        foregroundColor: Colors.white, // White text
        elevation: 8.0,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle: const TextStyle(
          fontFamily: 'Nunito',
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    ),
  );
}



// Function to define colors based on brightness and target color
ColorScheme colors(Brightness brightness, [Color? targetColor]) {
  final bool isDark = brightness == Brightness.dark;

  // Define the color to use
  final Color primaryColor = targetColor ?? Color(0xFFE5E5E5);

  return ColorScheme(
    brightness: brightness,
    primary: primaryColor,
    onPrimary: Colors.white,
    secondary: isDark ? Colors.tealAccent : Colors.teal,
    onSecondary: Colors.black,
    surface: isDark ? Colors.grey[800]! : Colors.grey[200]!,
    onSurface: isDark ? Colors.white : Colors.black,
    error: Colors.red,
    onError: Colors.white,
  );
}

// Function to return a default color if targetColor is null
Color source([Color? targetColor]) {
  return targetColor ?? Colors.pink;
}

// Custom page transition class
class FadePageRoute<T> extends PageRouteBuilder<T> {
  FadePageRoute({required Widget page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 0.05);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      var fadeAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);

      return SlideTransition(
        position: offsetAnimation,
        child: FadeTransition(opacity: fadeAnimation, child: child),
      );
    },
  );
}