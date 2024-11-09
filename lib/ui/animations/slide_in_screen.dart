import 'package:flutter/material.dart';

class SlideInScreen extends StatefulWidget {
  final bool isOpposite;
  const SlideInScreen({super.key, this.isOpposite = false});

  @override
  State<SlideInScreen> createState() => _SlideInScreenState();
}

class _SlideInScreenState extends State<SlideInScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    Offset begin = const Offset(-1.5, 0);
    Offset end = const Offset(0, 0);
    if (widget.isOpposite) {
      begin = const Offset(0, 0);
      end = const Offset(1.5, 0);
    }

    animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
        reverseDuration: const Duration(seconds: 2));
    animation = Tween<Offset>(begin: begin, end: end).animate(
        CurvedAnimation(parent: animationController, curve: Curves.decelerate));
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
          Center(
            child: SlideTransition(
              position: animation,
              child: Container(
                alignment: Alignment.center,
                color: Colors.redAccent,
                width: 250,
                height: 250,
                child: Text(widget.isOpposite ? 'Slide out' : 'Slide in'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _listener() {
    setState(() {});
  }
}
