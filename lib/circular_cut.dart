import 'dart:math';

import 'package:flutter/material.dart';

class CircularCut extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final halfWidth = size.width / 2;
    Path path = Path()
      ..lineTo(0, -100)
      ..arcTo(
        Rect.fromCircle(
          center: Offset(halfWidth, size.height / 2),
          radius: halfWidth,
        ),
        pi,
        -pi,
        false,
      )
      ..lineTo(size.width, -200)
      ..lineTo(0, -200)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
