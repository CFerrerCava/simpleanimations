import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simpleanimations/di/color_extension.dart';
import 'package:simpleanimations/ui/widgets/border_animation_box_widget.dart';

class FlipCardWidget extends StatefulWidget {
  const FlipCardWidget({super.key});

  @override
  State<FlipCardWidget> createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget> {
  late Timer timerFlip;
  bool flipX = true;
  @override
  void initState() {
    changeFlip();
    super.initState();
  }

  @override
  void dispose() {
    timerFlip.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BorderAnimationBox(
      child: Padding(
          padding: const EdgeInsets.all(5),
          child: AnimatedSwitcher(
            duration: const Duration(seconds: 2),
            transitionBuilder: transitionBuilder,
            layoutBuilder: (currentChild, previousChildren) => Stack(children: [
              currentChild ?? const SizedBox.shrink(),
              ...previousChildren
            ]),
            switchInCurve: Curves.easeInBack,
            switchOutCurve: Curves.easeOutBack,
            child: flipX
                ? getSide(text: 'Back side', boolKey: true)
                : getSide(text: 'Front Side', boolKey: false),
          )),
    );
  }

  void changeFlip() {
    timerFlip = Timer.periodic(const Duration(seconds: 3), (_) {
      setState(() {
        flipX = !flipX;
      });
    });
  }

  Widget getSide({required String text, required boolKey}) {
    final color = ColorExtension.randomColor();
    final textColor =
        ColorExtension.isColorObscure(color) ? Colors.white : Colors.black;
    return Container(
      key: ValueKey(boolKey),
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(25),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: ColorExtension.randomColor(),
          borderRadius: BorderRadius.circular(12)),
      child: Text(
        text,
        style: TextStyle(fontSize: 12, color: textColor),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget transitionBuilder(Widget child, Animation<double> animation) {
    final rotateAnimation = Tween(begin: pi, end: 0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnimation,
      child: child,
      builder: (_, builderChild) {
        final isUnder = (ValueKey(flipX) != widget.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final radians = isUnder
            ? min(rotateAnimation.value, pi / 2)
            : rotateAnimation.value;
        return Transform(
          transform: Matrix4.rotationY(radians.toDouble())
            ..setEntry(3, 0, tilt),
          alignment: Alignment.center,
          child: builderChild,
        );
      },
    );
  }
}
