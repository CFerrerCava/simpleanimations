import 'package:flutter/material.dart';

class FadeInOutScreen extends StatefulWidget {
  const FadeInOutScreen({super.key});

  @override
  State<FadeInOutScreen> createState() => _FadeInOutScreenState();
}

class _FadeInOutScreenState extends State<FadeInOutScreen>
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
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Opacity(
                opacity: 1.0 - animation.value,
                child: Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 200,
                  color: Colors.amberAccent,
                  child: const Text(
                    'Fade in out',
                  ),
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
}
