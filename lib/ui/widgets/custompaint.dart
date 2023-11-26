//Add this CustomPaint widget to the Widget Tree
import 'package:flutter/material.dart';

// CustomPaint(
//                         size: Size(
//                             50,
//                             (50 * 1.0555555555555556)
//                                 .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//                         painter: RPSCustomPainter(),
//                       ),

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3965444, size.height * 0.02686105);
    path_0.cubicTo(
        size.width * 0.4567056,
        size.height * -0.006044895,
        size.width * 0.5308278,
        size.height * -0.006044895,
        size.width * 0.5909889,
        size.height * 0.02686105);
    path_0.lineTo(size.width * 0.8776694, size.height * 0.1836650);
    path_0.cubicTo(
        size.width * 0.9378306,
        size.height * 0.2165711,
        size.width * 0.9748917,
        size.height * 0.2773842,
        size.width * 0.9748917,
        size.height * 0.3431947);
    path_0.lineTo(size.width * 0.9748917, size.height * 0.6568026);
    path_0.cubicTo(
        size.width * 0.9748917,
        size.height * 0.7226158,
        size.width * 0.9378306,
        size.height * 0.7834289,
        size.width * 0.8776694,
        size.height * 0.8163342);
    path_0.lineTo(size.width * 0.5909889, size.height * 0.9731395);
    path_0.cubicTo(
        size.width * 0.5308278,
        size.height * 1.006045,
        size.width * 0.4567056,
        size.height * 1.006045,
        size.width * 0.3965444,
        size.height * 0.9731395);
    path_0.lineTo(size.width * 0.1098633, size.height * 0.8163342);
    path_0.cubicTo(
        size.width * 0.04970194,
        size.height * 0.7834289,
        size.width * 0.01264106,
        size.height * 0.7226158,
        size.width * 0.01264106,
        size.height * 0.6568026);
    path_0.lineTo(size.width * 0.01264106, size.height * 0.3431947);
    path_0.cubicTo(
        size.width * 0.01264106,
        size.height * 0.2773842,
        size.width * 0.04970194,
        size.height * 0.2165711,
        size.width * 0.1098633,
        size.height * 0.1836650);
    path_0.lineTo(size.width * 0.3965444, size.height * 0.02686105);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = const Color.fromRGBO(26, 164, 131, 1);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
