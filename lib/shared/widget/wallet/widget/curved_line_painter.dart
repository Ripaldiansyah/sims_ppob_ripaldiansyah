import 'package:flutter/material.dart';

class CurvedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path1 = Path();
    path1.moveTo(size.width, 10);

    path1.cubicTo(
      size.width * 0.5,
      size.height * 0.4,
      size.width * 0.9,
      size.height * 0.7,
      size.width * 0.1,
      size.height + 12,
    );

    Paint paint1 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.4;
    canvas.drawPath(path1, paint1);

    Path path2 = Path();
    path2.moveTo(size.width, 35);
    path2.cubicTo(
      size.width * 0.6,
      size.height * 0.6,
      size.width * 0.9,
      size.height * 0.8,
      size.width * 0.1,
      size.height + 12,
    );

    Paint paint2 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.4;
    canvas.drawPath(path2, paint2);

    Path path3 = Path();
    path3.moveTo(size.width, 60);
    path3.cubicTo(
      size.width * 0.9,
      size.height * 0.6,
      size.width * 0.9,
      size.height * 0.8,
      size.width * 0.3,
      size.height + 12,
    );

    Paint paint3 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.4;
    canvas.drawPath(path3, paint3);

    Path path4 = Path();
    path4.moveTo(size.width, 85);
    path4.cubicTo(
      size.width * 0.8,
      size.height * 0.9,
      size.width * 0.8,
      size.height * 0.87,
      size.width * 0.6,
      size.height + 12,
    );

    Paint paint4 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.4;
    canvas.drawPath(path4, paint4);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
