import 'package:birthday_quest_app/ui/description_widget.dart';
import 'package:flutter/material.dart';
import 'ballon_widget.dart';
import 'corners_widget.dart';
import 'theme.dart'; // Ensure your theme is imported
import 'quest/quest_1.dart'; // Import your Quest screen

class QuestStartScreen extends StatefulWidget {
  final Function(String) onThemeChange;
  final bool showPopupMenu;

  QuestStartScreen({required this.onThemeChange, this.showPopupMenu = true});

  @override
  _QuestStartScreenState createState() => _QuestStartScreenState();
}

class _QuestStartScreenState extends State<QuestStartScreen> with SingleTickerProviderStateMixin {
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
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: widget.showPopupMenu
            ? [
          PopupMenuButton<String>(
            onSelected: widget.onThemeChange,
            itemBuilder: (BuildContext context) {
              return {'light', 'dark', 'pastel'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice.capitalize()), // Capitalization function
                );
              }).toList();
            },
          ),
        ]
            : null,
      ),
      body: Container(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hey, Oksana',
                    textAlign: TextAlign.center,
                    style: textTheme.displayLarge!.copyWith(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF103362),
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Happy Birthday Quest!',
                    textAlign: TextAlign.center,
                    style: textTheme.displayLarge!.copyWith(
                      fontFamily: 'Oldenburg',
                      color: Color(0xFF103362),
                    ),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        FadePageRoute(page: QuestOne()), // Assuming QuestOne is defined
                      );
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
            PositionedBalloon(animation: _animation), // Assuming this widget is defined
          ],
        ),
      ),
    );
  }
}
