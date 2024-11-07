import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simpleanimations/di/extension_path.dart';

Graphics get $graphics => Graphics();

class Graphics {
  var json = ExtensionPath.json.path;
  static const lottiePath = 'assets/lottie/';

  Widget get dashFirebase => Lottie.asset('${lottiePath}dash_firebase$json');
}
