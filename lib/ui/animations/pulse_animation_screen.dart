import 'package:flutter/material.dart';

class PulseAnimationScreen extends StatefulWidget {
  const PulseAnimationScreen({super.key});

  @override
  State<PulseAnimationScreen> createState() => _PulseAnimationScreenState();
}

class _PulseAnimationScreenState extends State<PulseAnimationScreen>
    with TickerProviderStateMixin {
  Size boxSize = const Size(100, 100);
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
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastLinearToSlowEaseIn));
    animationController.addListener(_listener);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: isRepeated ? stopRepeated : repeated,
              child: Text(isRepeated ? 'Pulse to stop' : 'Pulse to repeated')),
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: onTap,
                onLongPressDown: (details) {
                  animationController.animateTo(1,
                      curve: Curves.decelerate,
                      duration: const Duration(seconds: 4));
                },
                onLongPressUp: () => animationController.reverse(),
                onLongPressEnd: (_) => animationController.reverse(),
                child: Container(
                  alignment: Alignment.center,
                  width: boxSize.width * (1 + animation.value),
                  height: boxSize.height * (1 + animation.value),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.redAccent,
                  ),
                  child: const Text('llll'),
                ),
              ),
            ),
          )
        ],
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
}
