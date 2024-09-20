import 'package:flutter/material.dart';

class CornerImagesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            'assets/top_left.png',
            width: 500, // Adjust size as needed
            height: 219, // Adjust size as needed
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            'assets/right.png',
            width: 162, // Adjust size as needed
            height: 164, // Adjust size as needed
          ),
        ),
      ],
    );
  }
}


class CornerRightImagesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset(
            'assets/bottom_left.png',
            width: 162, // Adjust size as needed
            height: 164, // Adjust size as needed
          ),
        ),
        Positioned(
          bottom: 0.0,
          left: 0,
          right: 0, // Ensures the image is centered
          child: Image.asset(
            'assets/cake.png',
            width: 100, // Adjust size as needed
            height: 102, // Adjust size as needed
          ),
        ),
      ],
    );
  }
}


