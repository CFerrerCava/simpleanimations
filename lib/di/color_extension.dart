import 'dart:math';
import 'dart:ui';

class ColorExtension {
  static Color randomColor() {
    final random = Random();
    return Color.fromRGBO(random.nextInt(256), random.nextInt(256),
        random.nextInt(256), random.nextDouble());
  }

  static bool isColorObscure(Color color) {
    double brightness =
        (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;

    bool isDark = brightness < 0.4;
    return isDark;
  }
}
