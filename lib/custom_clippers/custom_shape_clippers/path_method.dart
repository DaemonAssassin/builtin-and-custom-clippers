import 'dart:math';

import 'package:flutter/material.dart';

class PathMethods extends StatefulWidget {
  const PathMethods({Key? key}) : super(key: key);

  @override
  State<PathMethods> createState() => _PathMethodsState();
}

class _PathMethodsState extends State<PathMethods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _buildShape()),
    );
  }

  Widget _buildShape() {
    return ClipPath(
      clipper: MyCustomShapeClipper(),
      child: Container(
        color: Colors.red,
        width: 600.0,
        height: 600.0,
      ),
    );
  }
}

class MyCustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // double width = size.width;
    // double height = size.height;
    // path.moveTo(width / 2, 0);
    // path.lineTo(0, height);
    // path.quadraticBezierTo(width / 2, height * 0.8, width, height);
    // path.close();

    //* => cubicTo()
    // useCubicTo(path, size);

    //* => arcToPoint()
    // useArcToPoint(path, size);

    //* => arcTo()
    // useArcTo(path, size);

    //* => addRect()
    // useAddRect(path, size);

    //* => addRRect()
    // useAddRRect(path, size);

    //* => addArc()
    // useAddArc(path, size);

    //* => addOval()
    // useAddOval(path, size);

    //* => addPolygon()
    // useAddPolygon(path, size);

    //* => addPath()
    // useAddPath(path, size);

    //* => conicTo()
    useConicTo(path, size);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

  void useCubicTo(Path path, Size size) {
    final double width = size.width;
    final double height = size.height;
    final firstControlPoint = Offset(width * 0.3, height - 300);
    final secondControlPoint = Offset(width * 0.8, height);
    final endPoint = Offset(width, height - 100);
    path.moveTo(width / 2, 0);
    path.lineTo(0, height - 100);
    path.cubicTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      secondControlPoint.dx,
      secondControlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );
  }

  void useArcToPoint(Path path, Size size) {
    final double width = size.width;
    final double height = size.height;
    const double radius = 50.0;
    path.moveTo(radius, 0);
    path.lineTo(width - radius, 0);
    path.arcToPoint(
      Offset(width, radius),
      radius: const Radius.circular(radius),
      clockwise: false,
    );
    path.lineTo(width, height - radius);
    path.arcToPoint(
      Offset(width - radius, height),
      radius: const Radius.circular(radius),
    );
    path.lineTo(radius, height);
    path.arcToPoint(
      Offset(0, height - radius),
      radius: const Radius.circular(radius),
    );
    path.lineTo(0, radius);
    path.arcToPoint(
      const Offset(radius, 0),
      radius: const Radius.elliptical(radius, radius * 0.8),
      clockwise: false,
    );
  }

  void useArcTo(Path path, Size size) {
    double space = 50;
    double width = size.width;
    double height = size.height;

    path.moveTo(space, 0);
    path.lineTo(width - space, 0);
    path.arcTo(
        Rect.fromPoints(
          Offset(size.width - space, 0),
          Offset(size.width, space + 50),
        ), // Rect
        degToRadians(270), // Start angle
        degToRadians(90), // Sweep angle
        false);
    path.lineTo(width, height - space);
    path.arcTo(
      Rect.fromPoints(
        Offset(width, height - space),
        Offset(width - space, height),
      ),
      degToRadians(0),
      degToRadians(90),
      false,
    );
    path.lineTo(space, height);
    path.arcTo(
      Rect.fromLTWH(0, height - space, space, space),
      degToRadians(90),
      degToRadians(90),
      false,
    );
    path.lineTo(0, space * 2);
    path.arcTo(
      Rect.fromLTRB(0, 0, space, space * 2),
      degToRadians(180),
      degToRadians(90),
      false,
    );
    path.close();
  }

  void useAddRect(Path path, Size size) {
    // double width = size.width;
    // double height = size.height;

    path.addRect(const Rect.fromLTRB(10, 10, 50, 50));
    path.addRect(const Rect.fromLTRB(100, 200, 150, 280));
    path.addRect(const Rect.fromLTRB(200, 400, 260, 480));
    path.close();
  }

  void useAddRRect(Path path, Size size) {
    double width = size.width;
    double height = size.height;

    path.addRRect(RRect.fromLTRBR(
      10,
      10,
      50,
      50,
      const Radius.circular(30.0),
    ));
    path.addRRect(RRect.fromLTRBR(
      100,
      200,
      150,
      280,
      const Radius.circular(30.0),
    ));
    path.addRRect(RRect.fromLTRBR(
      200,
      400,
      260,
      480,
      const Radius.circular(30.0),
    ));
    path.close();
  }

  void useAddArc(Path path, Size size) {
    path.addArc(const Rect.fromLTRB(10, 10, 50, 50), degToRadians(0),
        degToRadians(270));
    path.addArc(const Rect.fromLTRB(100, 200, 150, 280), degToRadians(0),
        degToRadians(270));
    path.addArc(const Rect.fromLTRB(200, 400, 260, 480), degToRadians(0),
        degToRadians(270));
    path.close();
  }

  void useAddOval(Path path, Size size) {
    path.addOval(const Rect.fromLTRB(10, 10, 50, 50));
    path.addOval(const Rect.fromLTRB(100, 200, 150, 280));
    path.addOval(const Rect.fromLTRB(200, 400, 260, 480));
    path.close();
  }

  void useAddPolygon(Path path, Size size) {
    var width = size.width;
    var height = size.height;
    path.addPolygon(
      [
        Offset(width / 2, 0),
        Offset(width * 0.2, height),
        Offset(width, height * 0.4),
        Offset(0, height * 0.4),
        Offset(width * 0.8, height),
      ],
      true,
    );
    path.close();
  }

  void useAddPath(Path path, Size size) {
    var width = size.width;
    var height = size.height;
    path.addPolygon(
      [
        Offset(width / 2, 0),
        Offset(width * 0.2, height),
        Offset(width, height * 0.4),
        Offset(0, height * 0.4),
        Offset(width * 0.8, height),
      ],
      true,
    );

    double innerWidth = width * 0.2;
    double innerHeight = height * 0.2;
    Path innerPath = Path();
    innerPath.addPolygon(
      [
        Offset(innerWidth / 2, 0),
        Offset(innerWidth * 0.2, innerHeight),
        Offset(innerWidth, innerHeight * 0.4),
        Offset(0, innerHeight * 0.4),
        Offset(innerWidth * 0.8, innerHeight),
      ],
      true,
    );

    path.addPath(innerPath, Offset(width * 0.7, height * 0.58));
    path.close();
  }

  void useConicTo(Path path, Size size) {
    path.lineTo(0, size.height);
    path.conicTo(size.width / 2, 0, size.width, size.height, 0.5);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
  }

  double degToRadians(double degree) {
    return degree * (pi / 180);
  }
}
