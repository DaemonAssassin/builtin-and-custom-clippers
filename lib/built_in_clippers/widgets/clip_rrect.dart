import 'package:flutter/material.dart';

class MyClipRRect extends StatefulWidget {
  const MyClipRRect({Key? key}) : super(key: key);

  @override
  State<MyClipRRect> createState() => MyClipRRectState();
}

class MyClipRRectState extends State<MyClipRRect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          color: Colors.yellow,
          width: 600.0,
          height: 600.0,
          child: _buildClipRect1(),
        ),
      ),
    );
  }

  Widget _buildClipRect1() {
    return ClipRRect(
      // borderRadius: BorderRadius.circular(30.0),
      clipper: MyCustomRRectClipper(),
      child: Container(
        color: Colors.purple,
        width: 600.0,
        height: 600.0,
      ),
    );
  }
}

class MyCustomRRectClipper extends CustomClipper<RRect> {
  @override
  RRect getClip(Size size) {
    // return RRect.fromLTRBAndCorners(200, 400, 400, 600,
    //     topRight: const Radius.circular(20.0));
    // return RRect.fromLTRBR(200, 400, 400, 600, const Radius.elliptical(20, 40));
    // return RRect.fromRectAndCorners(const Rect.fromLTRB(200, 400, 400, 600), to);
    return RRect.fromRectXY(const Rect.fromLTRB(200, 400, 400, 600), 20, 40);
    // return RRect.fromLTRBAndCorners(
    //   20,
    //   20,
    //   580.0,
    //   580.0,
    //   topLeft: const Radius.circular(200.0),
    //   bottomRight: const Radius.circular(200.0),
    // );
    // return RRect.fromLTRBR(20, 20, 580, 580, const Radius.circular(100.0));
    // return const RRect.fromLTRBXY(20, 20, 580, 300, 300, 300);
    // return RRect.fromRectAndCorners(
    //   const Rect.fromLTWH(20, 20, 560, 560),
    //   topLeft: const Radius.elliptical(40, 20),
    // );
  }

  @override
  bool shouldReclip(covariant CustomClipper<RRect> oldClipper) {
    return false;
  }
}
