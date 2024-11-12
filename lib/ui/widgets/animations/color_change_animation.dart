import 'dart:async';
import 'package:flutter/material.dart';
import 'package:simpleanimations/di/color_extension.dart';
import 'package:simpleanimations/ui/widgets/border_animation_box_widget.dart';

class ColorChangeAnimation extends StatefulWidget {
  const ColorChangeAnimation({super.key});

  @override
  State<ColorChangeAnimation> createState() => _ColorChangeAnimationState();
}

class _ColorChangeAnimationState extends State<ColorChangeAnimation> {
  late Timer timerColor;
  bool activeGradient = false;
  @override
  void initState() {
    super.initState();
    timer();
  }

  @override
  void dispose() {
    timerColor.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BorderAnimationBox(
        child: GestureDetector(
      onTap: _changeTypeColor,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
        width: 100,
        height: 100,
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: activeGradient ? null : ColorExtension.randomColor(),
          gradient: activeGradient
              ? LinearGradient(colors: [
                  ColorExtension.randomColor(),
                  ColorExtension.randomColor()
                ])
              : null,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          activeGradient ? 'Change to singular color' : 'Change to gradient',
          style: const TextStyle(fontSize: 10),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ),
    ));
  }

  timer() {
    timerColor = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  void _changeTypeColor() {
    setState(() {
      activeGradient = !activeGradient;
    });
  }
}
