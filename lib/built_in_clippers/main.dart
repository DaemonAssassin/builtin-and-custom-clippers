import 'package:flutter/material.dart';

import 'widgets/clip_rrect.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyClipRRect(),
    );
  }
}

//* CustomClipper, for information about creating custom clips.
//* ClipRect, for more efficient clips without rounded corners.
//* ClipRRect, for a clip with rounded corners.
//* ClipPath, for an arbitrarily shaped clip.
