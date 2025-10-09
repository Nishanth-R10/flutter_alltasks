import 'package:flutter/material.dart';

class GradientBorderPainter extends CustomPainter {
  final double borderRadius;
  final double strokeWidth;

  GradientBorderPainter({
    required this.borderRadius,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    
    path.moveTo(size.width * 0.4, 0);
    path.lineTo(size.width - borderRadius, 0);
    path.arcToPoint(
      Offset(size.width, borderRadius),
      radius: Radius.circular(borderRadius),
      clockwise: true,
    );
    path.lineTo(size.width, size.height * 0.4);

    final gradient = LinearGradient(
      colors: [
        const Color.fromARGB(255, 75, 174, 255).withOpacity(0.2),
        const Color.fromARGB(255, 76, 167, 228).withOpacity(0.8),
        const Color.fromARGB(255, 146, 199, 248),
      ],
      stops: [0.0, 0.5, 1.0],
    );

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}