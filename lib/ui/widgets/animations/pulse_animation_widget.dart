import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/long_press.dart';
import 'package:simpleanimations/ui/widgets/border_animation_box_widget.dart';

class PulseAnimationScreen extends StatefulWidget {
  const PulseAnimationScreen({super.key});

  @override
  State<PulseAnimationScreen> createState() => _PulseAnimationScreenState();
}

class _PulseAnimationScreenState extends State<PulseAnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  bool isRepeated = false;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        reverseDuration: const Duration(milliseconds: 250),
        duration: const Duration(seconds: 1));
    animation = Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastLinearToSlowEaseIn));
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
      child: SizedBox(
        width: 100,
        height: 100,
        child: Transform.scale(
          scale: 0.7 * (1 + animation.value),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.redAccent,
            ),
            child: const Text('llll'),
          ),
        ),
      ),
    );
  }

  void _listener() {
    setState(() {});
  }

  void onTap() {
    animationController.forward().then((_) {
      animationController.reverse();
    });
  }

  void repeated() {
    if (animation.isDismissed && !isRepeated) {
      changeUpdateState();
      animationController.repeat(reverse: true);
    }
  }

  void stopRepeated() {
    if (animation.isAnimating && isRepeated) {
      changeUpdateState();
      animationController.stop();
      animationController.animateBack(0);
    }
  }

  void changeUpdateState() {
    setState(() => isRepeated = !isRepeated);
  }

  void onLongPressDown(LongPressDownDetails details) {
    animationController.animateTo(1,
        curve: Curves.decelerate, duration: const Duration(seconds: 4));
  }

  void reverse() {
    animationController.reverse();
  }
}
