import 'package:flutter/material.dart';
import 'package:simpleanimations/di/color_extension.dart';
import 'package:simpleanimations/ui/widgets/border_animation_box_widget.dart';

class CurtainRevealWidget extends StatefulWidget {
  const CurtainRevealWidget({super.key});

  @override
  State<CurtainRevealWidget> createState() => _CurtainRevealWidgetState();
}

class _CurtainRevealWidgetState extends State<CurtainRevealWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
        reverseDuration: const Duration(seconds: 1))
      ..addListener(listener);

    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
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
      width: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          FadeTransition(
            opacity: animation,
            child: const Icon(
              Icons.airport_shuttle_outlined,
              size: 50,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cortainWidget(),
              cortainWidget(isOpposite: true),
            ],
          )
        ],
      ),
    ));
  }

  Widget cortainWidget({bool isOpposite = false}) => Transform.translate(
        offset: Offset(_offsetAnimator(isOpposite), 0),
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            ColorExtension.randomColor(),
            ColorExtension.randomColor()
          ])),
        ),
      );

  void listener() {
    setState(() {});
  }

  double _offsetAnimator(bool isOpposite) {
    return animation.value * (isOpposite ? 1 : -1) * 50;
  }
}
