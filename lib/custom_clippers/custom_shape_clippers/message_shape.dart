import 'package:flutter/material.dart';

class MessageShape extends StatelessWidget {
  const MessageShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildMessageShape(),
      ),
    );
  }

  Widget _buildMessageShape() {
    return ClipPath(
      clipper: MyCustomMessageClipper(),
      child: Container(
        width: 700,
        height: 200,
        color: Colors.purple,
        alignment: Alignment.centerLeft,
        child: const Text(
          'Hi, How are you?',
          style: TextStyle(
            fontSize: 48.0,
            fontWeight: FontWeight.bold,
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }
}

class MyCustomMessageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    final double width = size.width;
    final double height = size.height;

    // creating path / shape
    path.moveTo(0, height * 0.1);
    path.lineTo(0, height * 0.7);
    path.quadraticBezierTo(0, height * 0.8, height * 0.1, height * 0.8);
    path.lineTo(width - (height * 0.3), height * 0.8);
    path.quadraticBezierTo(
      width - (height * 0.10),
      height * 0.8,
      width,
      height,
    );
    path.quadraticBezierTo(
      width - (height * 0.1),
      height * 0.85,
      width - (height * 0.1),
      height * 0.7,
    );
    path.lineTo(width - (height * 0.1), height * 0.1);
    path.quadraticBezierTo(
      width - (height * 0.1),
      0,
      width - (height * 0.2),
      0,
    );
    path.lineTo(height * 0.1, 0);
    path.quadraticBezierTo(0, 0, 0, height * 0.1);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
