import 'package:flutter/material.dart';
import 'package:simpleanimations/ui/widgets/animations/ball_bouncing_widget.dart';
import 'package:simpleanimations/ui/widgets/animations/color_change_animation.dart';
import 'package:simpleanimations/ui/widgets/animations/curtain_reveal_widget.dart';
import 'package:simpleanimations/ui/widgets/animations/elastic_button_widget.dart';
import 'package:simpleanimations/ui/widgets/animations/fade_in_out_widget.dart';
import 'package:simpleanimations/ui/widgets/animations/flip_card_widget.dart';
import 'package:simpleanimations/ui/widgets/animations/loading_spiner_widget.dart';
import 'package:simpleanimations/ui/widgets/animations/progress_bar_widget.dart';
import 'package:simpleanimations/ui/widgets/animations/pulse_animation_widget.dart';
import 'package:simpleanimations/ui/widgets/animations/rotation_360.dart';
import 'package:simpleanimations/ui/widgets/animations/scale_up_down.dart';
import 'package:simpleanimations/ui/widgets/animations/slide_in_screen.dart';
import 'package:simpleanimations/ui/widgets/animations/zoom_effect_widget.dart';

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
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                children: getAnimations(),
              ),
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

  List<Widget> getAnimations() => [
        const BallBouncingWidget(),
        const ElasticButtonWidget(),
        const FadeInOutWidget(),
        const LoadingSpinerWidget(),
        const PulseAnimationScreen(),
        const SlideInWidget(),
        const SlideInWidget(isOpposite: true),
        const Rotation360(),
        const ScaleUpDown(),
        const ColorChangeAnimation(),
        const FlipCardWidget(),
        const ProgressBarWidget(),
        const ZoomEffectWidget(),
        const CurtainRevealWidget(),
      ];
}
