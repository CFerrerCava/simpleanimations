import 'dart:math';

import 'package:flutter/material.dart';

class LoadingSpinerScreen extends StatefulWidget {
  const LoadingSpinerScreen({super.key});

  @override
  State<LoadingSpinerScreen> createState() => _LoadingSpinerScreenState();
}

class _LoadingSpinerScreenState extends State<LoadingSpinerScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      reverseDuration: const Duration(seconds: 2),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.linearToEaseOut));

    controller
      ..addListener(_onAnimationListener)
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: CustomPaint(
                  painter: SpinnerPainting(
                    percentage: animation.value,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onAnimationListener() => setState(() {});
}

class SpinnerPainting extends CustomPainter {
  final Color? backgroundColor;
  final Color? color;
  final double? percentage;

  SpinnerPainting({
    this.backgroundColor,
    this.color,
    this.percentage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double startAngle = pi * 3 / 2;
    double sweepAngle = pi * 2 * (percentage ?? 0);
    final Paint paint = Paint()..color = color ?? Colors.blue;

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double outerRadius = size.width / 2;
    final double innerRadius = size.width / 3;

    final Path ringPath = Path()
      ..addOval(Rect.fromCircle(center: center, radius: outerRadius))
      ..addOval(Rect.fromCircle(center: center, radius: innerRadius))
      ..fillType = PathFillType.evenOdd;

    final ovalPaint = Paint()..color = backgroundColor ?? Colors.grey.shade300;
    canvas.drawPath(ringPath, ovalPaint);

    final Path arcPath = Path()
      ..moveTo(center.dx + outerRadius * cos(startAngle),
          center.dy + outerRadius * sin(startAngle))
      ..arcTo(
        Rect.fromCircle(center: center, radius: outerRadius),
        startAngle,
        sweepAngle,
        false,
      )
      ..lineTo(center.dx + innerRadius * cos(startAngle + sweepAngle),
          center.dy + innerRadius * sin(startAngle + sweepAngle))
      ..arcTo(
        Rect.fromCircle(center: center, radius: innerRadius),
        startAngle + sweepAngle,
        -sweepAngle,
        false,
      )
      ..close();

    canvas.drawPath(arcPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
