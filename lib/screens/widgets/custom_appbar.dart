import 'package:flutter/material.dart';

class UShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(0, size.height - 70);
    path.quadraticBezierTo(0, size.height, 70, size.height);
    path.lineTo(size.width - 70, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 70);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
