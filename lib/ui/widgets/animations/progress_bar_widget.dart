import 'package:flutter/material.dart';
import 'package:simpleanimations/ui/widgets/border_animation_box_widget.dart';

class ProgressBarWidget extends StatefulWidget {
  const ProgressBarWidget({super.key});

  @override
  State<ProgressBarWidget> createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<ProgressBarWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 4),
        reverseDuration: const Duration(seconds: 1))
      ..addListener(listener);
    animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));
    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BorderAnimationBox(
        child: CustomPaint(
      painter: ProgressBarPainter(progress: animation.value),
      size: const Size(300, 100),
    ));
  }

  void listener() {
    setState(() {});
  }
}

class ProgressBarPainter extends CustomPainter {
  final double progress;
  ProgressBarPainter({required this.progress});
  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    Paint backgroundPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blueGrey
      ..strokeWidth = 20;

    Paint customPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.redAccent
      ..strokeWidth = 20;

    canvas.drawLine(
        Offset(0, center.dy), Offset(size.width, center.dy), backgroundPaint);
    canvas.drawLine(Offset(0, center.dy),
        Offset(size.width * progress, center.dy), customPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
