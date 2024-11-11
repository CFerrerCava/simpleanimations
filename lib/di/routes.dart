import 'package:flutter/material.dart';
import 'package:simpleanimations/ui/screens/home_screen.dart';

class SimpleAnimationRoutes {
  static const homeScreen = 'home-screen';

  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    homeScreen: (_) => const HomeScreen(),
  };
}
