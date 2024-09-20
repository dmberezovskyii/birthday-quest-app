import 'package:flutter/cupertino.dart';

class PositionedBalloon extends AnimatedWidget {
  PositionedBalloon({required Animation<double> animation})
      : super(listenable: animation);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15.0 + (_progress.value * MediaQuery.of(context).size.height / 2), // Кулька зупиняється трохи нижче
      left: MediaQuery.of(context).size.width / 2 - 60, // Зміщення з урахуванням збільшеного розміру
      child: Image.asset(
        'assets/balloon.png',
        width: 120, // Збільшений розмір по ширині
        height: 180, // Збільшений розмір по висоті
      ),
    );
  }
}