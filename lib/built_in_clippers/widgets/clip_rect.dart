// ignore_for_file: unused_element

import 'package:flutter/material.dart';

class MyClipRect extends StatefulWidget {
  const MyClipRect({Key? key}) : super(key: key);

  @override
  State<MyClipRect> createState() => MyClipRectState();
}

class MyClipRectState extends State<MyClipRect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          color: Colors.yellow,
          width: 600.0,
          height: 600.0,
          child: _buildClipRect2(),
        ),
      ),
    );
  }

  Widget _buildClipRect1() {
    return ClipRect(
      child: Container(
        width: 600.0,
        height: 600.0,
        color: Colors.yellow,
      ),
    );
  }

  Widget _buildClipRect2() {
    return Container(
      color: Colors.yellow,
      child: ClipRect(
        clipBehavior: Clip.antiAlias,
        clipper: MyCustomRectClipper(),
        child: Container(
          width: 600.0,
          height: 600.0,
          color: Colors.purple,
        ),
      ),
    );
  }
}

class MyCustomRectClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCenter(
        center: const Offset(550, 550), width: 100, height: 100);
    // return Rect.fromCenter(
    //   center: const Offset(0.0, 0.0),
    //   width: 600.0,
    //   height: 600.0,
    // );
    // return Rect.fromCircle(
    //   center: const Offset(200.0, 0.0),
    //   radius: 50.0,
    // );

    // return const Rect.fromLTRB(300.0, 300.0, 600.0, 600.0);
    // return const Rect.fromLTWH(300.0, 300.0, 300.0, 300.0);
    // return Rect.fromPoints(
    //     const Offset(150.0, 150.0), const Offset(450.0, 450.0));
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}
