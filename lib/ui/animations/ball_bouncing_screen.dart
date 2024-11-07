import 'package:flutter/material.dart';

class BallBouncingScreen extends StatefulWidget {
  const BallBouncingScreen({super.key});

  @override
  State<BallBouncingScreen> createState() => _BallBouncingScreenState();
}

class _BallBouncingScreenState extends State<BallBouncingScreen>
    with TickerProviderStateMixin {
  late AnimationController ballBouncingController;
  late Animation<double> ballBouncingAnimation;
  double screenHeight = 250;
  double screenWidth = 0;
  double ballSize = 100;

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
  }

  @override
  void dispose() {
    ballBouncingAnimation.removeListener(ballBouncingListener);
    ballBouncingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.sizeOf(context).height * 0.7;
    screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              child: Stack(
            children: [
              Positioned(
                  top: ballBouncingAnimation.value * (screenHeight),
                  left: screenWidth / 2 - ballSize / 2,
                  child: GestureDetector(
                    onDoubleTap: initAnimation,
                    child: Container(
                      width: ballSize,
                      height: ballSize,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ))
            ],
          ))
        ],
      ),
    );
  }

  void ballBouncingListener() => setState(() {});

  void initAnimation() {
    if (ballBouncingController.isAnimating) return;
    ballBouncingController.repeat(reverse: true);
  }
}
