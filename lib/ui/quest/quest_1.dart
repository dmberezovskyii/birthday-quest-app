import 'package:flutter/material.dart';
import '../buttons/bottom_question_check_widget.dart';
import '../corners_widget.dart'; // Import the new widget

class QuestOne extends StatefulWidget {
  @override
  _QuestOneState createState() => _QuestOneState();
}

class _QuestOneState extends State<QuestOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Вітаємо тебе в квесті Happy Birthday Challenge!',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF103362),
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Ось зашифроване слово підказка, яке допоможе тобі пройти цей квест:',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'HBSEFOJB',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF103362),
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    // Add hint text logic if needed
                  ],
                ),
              ),
            ),
          ),
          CornerImagesWidget(),
          CombinedActionButtonWidget(),
        ],
      ),
    );
  }
}
