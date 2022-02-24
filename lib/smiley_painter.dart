import 'package:flutter/material.dart';
import 'dart:math' as Math;

class SmileyPainter extends CustomPainter {
  final int rating;
  SmileyPainter({required this.rating});

  @override
  void paint(Canvas canvas, Size size) {
    final radius = Math.min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);

    switch (rating) {
      case 1:
        drawAngryFace(canvas, radius, center);
        break;
      case 2:
        drawSadFace(canvas, radius, center);
        break;
      case 3:
        drawNeutralFace(canvas, radius, center);
        break;
      case 4:
        drawSmileyFace(canvas, radius, center, size);
        break;
      case 5:
        drawWideSmileyFace(canvas, radius, center, size);
        break;
        break;
      default:
        drawSmileyFace(canvas, radius, center, size);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  void drawSmileyFace(Canvas canvas, double radius, Offset center, Size size) {
    // Draw the body
    final paint = Paint()..color = Colors.lightGreen;
    canvas.drawCircle(center, radius, paint);

    // Draw the mouth
    final smilePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    var startPoint = Offset(25.0, size.height / 2 + 10.0);
    var firstControlPoint = Offset(size.width / 4, size.height / 2 + 35.0);
    var secondControlPoint = Offset(3 * size.width / 4, size.height / 2 + 35.0);
    var endPoint = Offset(size.width - 25.0, size.height / 2 + 10.0);

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(firstControlPoint.dx, firstControlPoint.dy,
        secondControlPoint.dx, secondControlPoint.dy, endPoint.dx, endPoint.dy);
    canvas.drawPath(path, smilePaint);

    // Draw the eyes
    canvas.drawCircle(
        Offset(center.dx - radius / 2, center.dy - radius / 2 + 10.0),
        8,
        Paint());
    canvas.drawCircle(
        Offset(center.dx + radius / 2, center.dy - radius / 2 + 10.0),
        8,
        Paint());
  }

  void drawSadFace(Canvas canvas, double radius, Offset center) {
    // Draw the body
    final paint = Paint()..color = Colors.orange;
    canvas.drawCircle(center, radius, paint);

    // Draw the mouth
    final smilePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    canvas.drawArc(
        Rect.fromCircle(center: center + Offset(0.0, 30.0), radius: radius / 2),
        0,
        -Math.pi,
        false,
        smilePaint);

    // Draw the eyes
    canvas.drawCircle(
        Offset(center.dx - radius / 2, center.dy - radius / 2 + 10.0),
        8,
        Paint());
    canvas.drawCircle(
        Offset(center.dx + radius / 2, center.dy - radius / 2 + 10.0),
        8,
        Paint());
  }

  void drawAngryFace(Canvas canvas, double radius, Offset center) {
    // Draw the body
    final paint = Paint()..color = Colors.red;
    canvas.drawCircle(center, radius, paint);

    // Draw the mouth
    final smilePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    canvas.drawArc(
        Rect.fromCircle(center: center + Offset(0.0, 30.0), radius: radius / 2),
        0,
        -Math.pi,
        false,
        smilePaint);

    canvas.drawLine(
        Offset(center.dx - radius + 20, center.dy - radius / 1.5 + 5),
        Offset(center.dx - radius / 3.5, center.dy - radius / 3),
        smilePaint);

    canvas.drawLine(
        Offset(center.dx + radius / 2 + 10, center.dy - radius / 2 - 5),
        Offset(center.dx + radius / 3, center.dy - radius / 3),
        smilePaint);

    // Draw the eyes
    canvas.drawCircle(
        Offset(center.dx - radius / 2, center.dy - radius / 2 + 10.0),
        8,
        Paint());
    canvas.drawCircle(
        Offset(center.dx + radius / 2, center.dy - radius / 2 + 10.0),
        8,
        Paint());
  }

  void drawNeutralFace(Canvas canvas, double radius, Offset center) {
    // Draw the body
    final paint = Paint()..color = Colors.yellow;
    canvas.drawCircle(center, radius, paint);

    // Draw the mouth
    final smilePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    canvas.drawLine(Offset(center.dx - radius / 2, center.dy + radius / 4),
        Offset(center.dx + radius / 2, center.dy + radius / 4), smilePaint);

    // Draw the eyes
    canvas.drawCircle(
        Offset(center.dx - radius / 2, center.dy - radius / 2 + 10.0),
        8,
        Paint());
    canvas.drawCircle(
        Offset(center.dx + radius / 2, center.dy - radius / 2 + 10.0),
        8,
        Paint());
  }

  void drawWideSmileyFace(
      Canvas canvas, double radius, Offset center, Size size) {
    // Draw the body
    final paint = Paint()..color = Colors.green;
    canvas.drawCircle(center, radius, paint);

    // Draw the mouth
    final smilePaint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;
    canvas.drawArc(
        Rect.fromCircle(center: center + Offset(0.0, 10.0), radius: radius / 2),
        0,
        Math.pi,
        false,
        smilePaint);
    // Draw the eyes
    canvas.drawCircle(
        Offset(center.dx - radius / 2, center.dy - radius / 2 + 10.0),
        8,
        Paint());
    canvas.drawCircle(
        Offset(center.dx + radius / 2, center.dy - radius / 2 + 10.0),
        8,
        Paint());
  }
}
