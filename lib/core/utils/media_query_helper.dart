import 'package:flutter/material.dart';

class MediaQueryHelper {
  final BuildContext context;
  late double _screenWidth;
  late double _screenHeight;
  late double _height;
  late double _width;

  MediaQueryHelper(this.context) {
    final mediaQuery = MediaQuery.of(context);
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _height = mediaQuery.size.height;
    _width = mediaQuery.size.width;
  }

  double get screenHeight => _height;

  double get screenWidth => _width;

  double widthPercentage(double percentage) {
    return (_screenWidth * percentage) / 100;
  }

  double heightPercentage(double percentage) {
    return (_screenHeight * percentage) / 100;
  }

  double textSize(double baseSize) {
    double scaleFactor = _screenWidth / 375; // 375 es un ancho de referencia (iPhone SE)
    double scaledSize = baseSize * scaleFactor;
    return scaledSize.clamp(baseSize, baseSize * 1); // No crece más del 50%
  }
}