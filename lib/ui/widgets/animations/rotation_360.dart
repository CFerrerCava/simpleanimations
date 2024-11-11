import 'package:flutter/material.dart';
import 'package:simpleanimations/ui/widgets/border_animation_box_widget.dart';

class Rotation360 extends StatefulWidget {
  const Rotation360({super.key});

  @override
  State<Rotation360> createState() => _Rotation360State();
}

class _Rotation360State extends State<Rotation360>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 3),
        reverseDuration: const Duration(seconds: 1))
      ..addListener(_listener);
    animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut));
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
        child: RotationTransition(
      turns: animation,
      child: const Icon(
        Icons.domain_add_sharp,
        size: 150,
      ),
    ));
  }

  void _listener() {
    setState(() {});
  }
}
