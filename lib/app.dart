import 'package:flutter/material.dart';
import 'ui/theme.dart'; // Ensure your theme is imported
import 'ui/quest_home_screen.dart'; // Import QuestStartScreen

class BirthdayQuestApp extends StatefulWidget {
  final ThemeData initialTheme;
  final Widget? homeScreen;

  BirthdayQuestApp({required this.initialTheme, this.homeScreen});

  @override
  _BirthdayQuestAppState createState() => _BirthdayQuestAppState();
}

class _BirthdayQuestAppState extends State<BirthdayQuestApp> {
  late ThemeData currentTheme;

  @override
  void initState() {
    super.initState();
    currentTheme = widget.initialTheme; // Use the passed initial theme
  }

  void switchTheme(String themeName) {
    setState(() {
      switch (themeName) {
        case 'light':
          currentTheme = light();
          break;
        case 'dark':
          currentTheme = dark();
          break;
        case 'pastel':
          currentTheme = pastelTheme();
          break;
        default:
          currentTheme = light(); // Fallback to light theme
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Birthday Quest',
      theme: currentTheme,
      home: widget.homeScreen ?? QuestStartScreen(onThemeChange: switchTheme), // Optional homeScreen
    );
  }
}
