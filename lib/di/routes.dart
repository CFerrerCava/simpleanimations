import 'package:flutter/material.dart';
import 'package:simpleanimations/animations/ball_bouncing_screen.dart';
import 'package:simpleanimations/home_screen.dart';

class SimpleAnimationRoutes {
  static const homeScreen = 'home-screen';
  static const bouncingBall = 'bouncing-ball';

  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    homeScreen: (_) => const HomeScreen(),
    bouncingBall: (_) => const BallBouncingScreen(),
  };
}
