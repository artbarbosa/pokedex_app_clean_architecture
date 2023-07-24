import 'dart:math';

import 'package:flutter/material.dart';

class RoundedDiagonalPathClipper extends CustomClipper<Path> {
  double _getY(double x) {
    return x * 0.2;
  }

  @override
  Path getClip(Size size) {
    var roundnessFactor = 40.0;
    var equalization = 10.0;
    var path = Path();

    path.moveTo(0, roundnessFactor);
    path.lineTo(0, size.height - roundnessFactor);

    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
    path.lineTo(size.width - roundnessFactor, size.height);

    path.quadraticBezierTo(size.width, size.height, size.width, size.height - roundnessFactor);

    path.lineTo(size.width, _getY(size.width) + roundnessFactor - equalization);
    path.quadraticBezierTo(
        size.width,
        _getY(size.width),
        size.width - roundnessFactor + equalization,
        _getY(size.width - roundnessFactor + equalization));

    path.lineTo(roundnessFactor + equalization, _getY(roundnessFactor + equalization));
    path.quadraticBezierTo(0, 0, 0, roundnessFactor + equalization);

    return _flip(path, size.width);
  }

  Path _flip(Path path, double width) {
    final m = Matrix4.identity()
      ..translate(width)
      ..rotateY(pi);
    return path.transform(m.storage);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
