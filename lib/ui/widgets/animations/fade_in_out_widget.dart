import 'package:flutter/material.dart';
import 'package:simpleanimations/ui/widgets/border_animation_box_widget.dart';

class FadeInOutWidget extends StatefulWidget {
  const FadeInOutWidget({super.key});

  @override
  State<FadeInOutWidget> createState() => _FadeInOutWidgetState();
}

class _FadeInOutWidgetState extends State<FadeInOutWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        reverseDuration: const Duration(seconds: 1));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));
    animationController.addListener(_listener);
    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BorderAnimationBox(
      child: Opacity(
        opacity: 1.0 - animation.value,
        child: Container(
          alignment: Alignment.center,
          width: 100,
          height: 100,
          color: Colors.amberAccent,
          child: const Text(
            'Fade in out',
          ),
        ),
      ),
    );
  }

  void _listener() {
    setState(() {});
  }
}
