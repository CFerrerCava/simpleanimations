import 'package:flutter/material.dart';
import 'package:simpleanimations/ui/widgets/border_animation_box_widget.dart';

class ZoomEffectWidget extends StatefulWidget {
  const ZoomEffectWidget({super.key});

  @override
  State<ZoomEffectWidget> createState() => _ZoomEffectWidgetState();
}

class _ZoomEffectWidgetState extends State<ZoomEffectWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(min: 0, max: 1, reverse: true)
          ..addListener(listener);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BorderAnimationBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            return Transform.scale(
              scale: controller.value,
              child: const Icon(
                Icons.integration_instructions,
                size: 50,
              ),
            );
          },
        ),
      ),
    );
  }

  void listener() {
    setState(() {});
  }
}
