import 'package:flutter/material.dart';
import 'package:simpleanimations/ui/widgets/border_animation_box_widget.dart';

class SlideInWidget extends StatefulWidget {
  final bool isOpposite;
  const SlideInWidget({super.key, this.isOpposite = false});

  @override
  State<SlideInWidget> createState() => _SlideInWidgetState();
}

class _SlideInWidgetState extends State<SlideInWidget>
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
    return BorderAnimationBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SlideTransition(
          position: animation,
          child: Container(
            alignment: Alignment.center,
            color: Colors.redAccent,
            width: 50,
            height: 50,
            child: Text(widget.isOpposite ? 'Slide out' : 'Slide in'),
          ),
        ),
      ),
    );
  }

  void _listener() {
    setState(() {});
  }
}
