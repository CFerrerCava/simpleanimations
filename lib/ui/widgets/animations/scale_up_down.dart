import 'package:flutter/material.dart';
import 'package:simpleanimations/ui/widgets/border_animation_box_widget.dart';

class ScaleUpDown extends StatefulWidget {
  const ScaleUpDown({super.key});

  @override
  State<ScaleUpDown> createState() => _ScaleUpDownState();
}

class _ScaleUpDownState extends State<ScaleUpDown>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
        reverseDuration: const Duration(seconds: 1))
      ..addListener(listener);
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut));
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
        child: Padding(
      padding: const EdgeInsets.all(25),
      child: Transform.scale(
        scale: (3 * animation.value) + 1,
        child: const Icon(Icons.data_exploration_sharp),
      ),
    ));
  }

  void listener() {
    setState(() {});
  }
}
