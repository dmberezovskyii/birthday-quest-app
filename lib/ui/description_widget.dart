import 'package:flutter/material.dart';
import 'corners_widget.dart';
import '../final_screen.dart';

class DescriptionWidget extends StatefulWidget {
  final Function(String) onThemeChange;

  DescriptionWidget({required this.onThemeChange});

  @override
  _DescriptionWidgetState createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();

    _animation = Tween<double>(begin: 1.0, end: 0.2).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonTheme = theme.elevatedButtonTheme.style;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: widget.onThemeChange,
            itemBuilder: (BuildContext context) {
              return {'light', 'dark', 'pastel', 'pink'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice.capitalize()), // Capitalization extension
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Container(
        color: theme.scaffoldBackgroundColor, // Apply theme background color
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Вірно відгадано! Гадаю ти вже знаєш куди рухатись, а після раджу відновити втрачені сили та перекусити )))",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: buttonTheme, // Button style from theme
                    onPressed: () {
                      if (mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FinalScreen(animation: _animation),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Почати квест',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            CornerImagesWidget(), // Assuming this widget is defined
          ],
        ),
      ),
    );
  }
}

// Extension to capitalize the first letter (optional)
extension StringCasingExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
