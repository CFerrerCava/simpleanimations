import 'package:flutter/material.dart';

class RouteTransitions {
  static Route transition({required Widget page}) => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          const begin = Offset(0, 1);
          const end = Offset.zero;
          final tween = Tween<Offset>(begin: begin, end: end);
          final curvedAnimation = CurvedAnimation(
              parent: animation, curve: Curves.fastEaseInToSlowEaseOut);
          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: page,
          );
        },
      );
}
