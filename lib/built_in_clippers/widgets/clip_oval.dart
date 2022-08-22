// ignore_for_file: unused_element

import 'package:flutter/material.dart';

class MyClipOval extends StatefulWidget {
  const MyClipOval({Key? key}) : super(key: key);

  @override
  State<MyClipOval> createState() => MyClipOvalState();
}

class MyClipOvalState extends State<MyClipOval> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: _buildClipOval3(),
      ),
    );
  }

  // same width and height
  Widget _buildClipOval1() {
    return Container(
      width: 300.0,
      height: 300.0,
      color: Colors.cyan,
      child: ClipOval(
        child: Container(
          width: 300.0,
          height: 300.0,
          color: Colors.amber,
        ),
      ),
    );
  }

  // diff width and height
  Widget _buildClipOval2() {
    return ClipOval(
      child: Container(
        width: 600.0,
        height: 400.0,
        color: Colors.amber,
      ),
    );
  }

  // Using clip ppty
  Widget _buildClipOval3() {
    return Container(
      color: Colors.blue,
      child: ClipOval(
        clipBehavior: Clip.antiAlias,
        clipper: MyCustomClipper(),
        child: Container(
          width: 300.0,
          height: 300.0,
          color: Colors.amber,
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    final width = size.width;
    final height = size.height;
    const centerOffset = Offset(0, 100);
    const endOffset = Offset(100, 200);
    // return Rect.fromCenter(center: centerOffset, width: 40.0, height: 40.0);
    // return Rect.fromCircle(center: centerOffset, radius: 40.0);
    // return Rect.fromLTRB(width - 100, height - 100, width - 100, height - 100);
    // return Rect.fromLTWH(width - 100, height - 100, 100, 100);
    return Rect.fromPoints(centerOffset, endOffset);
    // return Rect.fromCenter(
    //   center: const Offset(100.0, 100.0),
    //   height: 100.0,
    //   width: 200.0,
    // );
    // return Rect.fromCircle(
    //   center: const Offset(100.0, 100.0),
    //   radius: 100.0,
    // );
    // return const Rect.fromLTRB(0, 0, 150.0, 150.0);
    // return const Rect.fromLTWH(210, 210, 100, 100);
    // return Rect.fromPoints(const Offset(0, 0), const Offset(300, 200));
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}
