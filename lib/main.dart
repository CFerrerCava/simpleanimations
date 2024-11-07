import 'package:flutter/material.dart';
import 'package:simpleanimations/di/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: SimpleAnimationRoutes.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SimpleAnimationRoutes.homeScreen,
    );
  }
}
