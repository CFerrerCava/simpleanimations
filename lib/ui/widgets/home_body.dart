import 'package:flutter/material.dart';
import 'package:simpleanimations/di/graphics.dart';

class HomeBody extends StatelessWidget {
  final Function() onNext;
  const HomeBody({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Text(
            'Simple animations repo',
            style: TextStyle(
              color: Colors.black,
              fontSize: 50,
              fontWeight: FontWeight.w700,
              letterSpacing: 2.5,
            ),
            textAlign: TextAlign.center,
          )),
          const SizedBox(height: 50),
          Flexible(child: $graphics.dashFirebase),
          const SizedBox(height: 100),
          ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              onPressed: onNext,
              child: const Text(
                'Next',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ))
        ],
      ),
    );
  }
}
