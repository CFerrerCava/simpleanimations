import 'package:flutter/material.dart';
import 'package:simpleanimations/ui/animations/ball_bouncing_screen.dart';
import 'package:simpleanimations/ui/animations/loading_spiner_screen.dart';
import 'package:simpleanimations/ui/screens/home_screen.dart';

class SimpleAnimationRoutes {
  static const homeScreen = 'home-screen';
  static const bouncingBall = 'bouncing-ball';
  static const loadingSpiner = 'loading-spinner';

  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    homeScreen: (_) => const HomeScreen(),
    bouncingBall: (_) => const BallBouncingScreen(),
    loadingSpiner: (_) => const LoadingSpinerScreen(),
  };
}
