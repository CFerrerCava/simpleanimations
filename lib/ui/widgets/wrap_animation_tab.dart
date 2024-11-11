import 'package:flutter/material.dart';
import 'package:simpleanimations/ui/widgets/animations/ball_bouncing_widget.dart';
import 'package:simpleanimations/ui/widgets/animations/elastic_button_widget.dart';
import 'package:simpleanimations/ui/widgets/animations/fade_in_out_widget.dart';
import 'package:simpleanimations/ui/widgets/animations/loading_spiner_widget.dart';
import 'package:simpleanimations/ui/widgets/animations/pulse_animation_widget.dart';
import 'package:simpleanimations/ui/widgets/animations/rotation_360.dart';
import 'package:simpleanimations/ui/widgets/animations/scale_up_down.dart';
import 'package:simpleanimations/ui/widgets/animations/slide_in_screen.dart';

class WrapAnimationTab extends StatefulWidget {
  final Function() onBefore;
  const WrapAnimationTab({super.key, required this.onBefore});

  @override
  State<WrapAnimationTab> createState() => _WrapAnimationTabState();
}

class _WrapAnimationTabState extends State<WrapAnimationTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          const Expanded(
            child: Wrap(
              children: [
                BallBouncingWidget(),
                ElasticButtonWidget(),
                FadeInOutWidget(),
                LoadingSpinerWidget(),
                PulseAnimationScreen(),
                SlideInWidget(),
                SlideInWidget(isOpposite: true),
                Rotation360(),
                ScaleUpDown(),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: widget.onBefore,
              child: const Text(
                'Back',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue),
              ))
        ],
      ),
    );
  }
}
