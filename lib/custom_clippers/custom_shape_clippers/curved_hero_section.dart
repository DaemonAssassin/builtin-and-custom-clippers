import 'package:flutter/material.dart';

class CurvedHeroSection extends StatefulWidget {
  const CurvedHeroSection({Key? key}) : super(key: key);

  @override
  State<CurvedHeroSection> createState() => _CurvedHeroSectionState();
}

class _CurvedHeroSectionState extends State<CurvedHeroSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: ClipPath(
              clipper: MyCustomHeroClipper(),
              child: Container(
                height: 200.0,
                color: Colors.red,
              ),
            ),
          ),
          ClipPath(
            clipper: MyCustomHeroClipper(),
            child: Container(
              height: 180.0,
              color: Colors.red,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 20.0),
              child: const Text(
                'Custom Clippers',
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomHeroClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    final double width = size.width;
    final double height = size.height;

    path.lineTo(0, height);
    path.quadraticBezierTo(width * 0.2, height, width * 0.35, height * 0.8);
    path.quadraticBezierTo(width * 0.7, height * 0.4, width, height);
    path.lineTo(width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
