import 'package:flutter/material.dart';

class BorderAnimationBox extends StatelessWidget {
  final Widget child;
  const BorderAnimationBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 3),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
            )
          ],
          borderRadius: BorderRadius.circular(25)),
      child: child,
    );
  }
}
