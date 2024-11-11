import 'package:flutter/material.dart';
import 'package:simpleanimations/ui/widgets/border_animation_box_widget.dart';

class ElasticButtonWidget extends StatefulWidget {
  const ElasticButtonWidget({super.key});

  @override
  State<ElasticButtonWidget> createState() => _ElasticButtonWidgetState();
}

class _ElasticButtonWidgetState extends State<ElasticButtonWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  double plusWidth = 0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        reverseDuration: const Duration(milliseconds: 250))
      ..addListener(listener);
    animation = Tween<double>(begin: 1, end: 0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceIn));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BorderAnimationBox(
      child: GestureDetector(
        onTap: onPressed,
        onHorizontalDragUpdate: onHorizontalDragUpdate,
        child: Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            color: Colors.amberAccent,
            borderRadius: BorderRadius.circular(25),
          ),
          width: 100 * (1 + animation.value) + plusWidth,
          child: const Text('Elastic'),
        ),
      ),
    );
  }

  void onPressed() {
    if (controller.isDismissed) {
      controller.forward().then((_) {
        controller.reverse();
      });
    }
  }

  void listener() {
    setState(() {});
  }

  void onHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      final dx = details.localPosition.dx;
      plusWidth = dx <= -100 ? 0 : dx;
    });
  }

  double getWidth() => MediaQuery.sizeOf(context).width;
}
