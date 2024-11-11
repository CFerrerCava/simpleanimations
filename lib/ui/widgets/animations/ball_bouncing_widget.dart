import 'package:flutter/material.dart';
import 'package:simpleanimations/ui/widgets/border_animation_box_widget.dart';

class BallBouncingWidget extends StatefulWidget {
  const BallBouncingWidget({super.key});

  @override
  State<BallBouncingWidget> createState() => _BallBouncingWidgetState();
}

class _BallBouncingWidgetState extends State<BallBouncingWidget>
    with TickerProviderStateMixin {
  late AnimationController ballBouncingController;
  late Animation<double> ballBouncingAnimation;

  double ballSize = 50;

  @override
  void initState() {
    super.initState();

    ballBouncingController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
        reverseDuration: const Duration(seconds: 2));
    ballBouncingAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: ballBouncingController, curve: Curves.bounceOut))
      ..addListener(ballBouncingListener);
    ballBouncingController.repeat(reverse: true);
  }

  @override
  void dispose() {
    ballBouncingAnimation.removeListener(ballBouncingListener);
    ballBouncingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BorderAnimationBox(
      child: Column(
        children: [
          const Text('Ball Bouncing animation'),
          SizedBox(
            width: screenSize(),
            height: screenSize(),
            child: Stack(
              children: [
                Positioned(
                    top: ballBouncingAnimation.value * screenSize(),
                    left: screenSize() / 2 - ballSize / 2,
                    child: Container(
                      width: ballSize,
                      height: ballSize,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  void ballBouncingListener() => setState(() {});

  double screenSize() {
    return MediaQuery.sizeOf(context).width * .3;
  }
}
