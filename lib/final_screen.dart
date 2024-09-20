import 'package:flutter/material.dart';
import 'ui/ballon_widget.dart';
import 'ui/corners_widget.dart';

class FinalScreen extends StatelessWidget {
  final Animation<double> animation;

  FinalScreen({required this.animation});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme; // Access the text theme

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Stack(
          children: [
            Center(
              child: Text(
                'Happy Birthday!',
                textAlign: TextAlign.center,
                style: textTheme.displayLarge!.copyWith(
                  fontFamily: 'Oldenburg',
                  color: Color(0xFF103362),
                ),
              ),
            ),
            CornerImagesWidget(),
            CornerRightImagesWidget(),
            PositionedBalloon(animation: animation), // Add the balloon animation
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text(
                  'Моя кохана, з Днем народження!\n'
                      'Ти – моя радість і підтримка. Нехай цей день буде сповнений тепла, радості. Нехай твої мрії здійснюються з легкістю, а кожен новий день приносить тільки щастя. Я вдячний долі за тебе, кохаю тебе безмежно і бажаю, щоб цей рік став початком найкращих пригод у твоєму житті!',
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Закрити'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(
          Icons.favorite, // Сердечко
          color: Colors.red,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
