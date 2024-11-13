import 'package:flutter/material.dart';
import 'package:simpleanimations/di/route_transitions.dart';
import 'package:simpleanimations/ui/screens/test_screen.dart';
import 'package:simpleanimations/ui/widgets/border_animation_box_widget.dart';

class SlideTransitionWidget extends StatelessWidget {
  const SlideTransitionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BorderAnimationBox(
        child: GestureDetector(
      onTap: () => onTap(context),
      child: const Padding(
        padding: EdgeInsets.all(25),
        child: Text('Push to '),
      ),
    ));
  }

  Future<void> onTap(BuildContext context) async {
    await Navigator.of(context)
        .push(RouteTransitions.transition(page: const TestScreen()));
  }
}
