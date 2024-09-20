import 'package:birthday_quest_app/ui/quest_home_screen.dart';
import 'package:flutter/material.dart';
import 'app.dart'; // Import the main app structure
import 'ui/theme.dart'; // Import your theme definitions

void main(List<String> args) {
  // Set the default theme to dark
  ThemeData initialTheme = dark();
  bool showPopupMenu = false; // Default to showing the popup menu

  // Check for command-line arguments
  if (args.isNotEmpty) {
    for (var arg in args) {
      String lowerArg = arg.toLowerCase();
      switch (lowerArg) {
        case 'light':
          initialTheme = light();
          break;
        case 'dark':
          initialTheme = dark();
          break;
        case 'pastel':
          initialTheme = pastelTheme();
          break;
        case 'no-popup':
          showPopupMenu = false; // Disable popup menu if "no-popup" is passed
          break;
      }
    }
  }

  runApp(BirthdayQuestApp(
    initialTheme: initialTheme,
    homeScreen: QuestStartScreen(
      onThemeChange: (String themeName) {
        // handle theme change
      },
      showPopupMenu: showPopupMenu, // Pass the popup menu flag
    ),
  ));
}
