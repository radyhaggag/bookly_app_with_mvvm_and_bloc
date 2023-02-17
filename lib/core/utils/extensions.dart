import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  Size get _screenSize => MediaQuery.of(this).size;
  double get screenWidth => _screenSize.width;
  double get screenHeight => _screenSize.height;
}
