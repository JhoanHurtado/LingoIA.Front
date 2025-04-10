import 'package:flutter/material.dart';

class CustomPageIndicator extends StatelessWidget {
  final int pageCount;
  final int currentIndex;
  final double dotSize;
  final double spacing;
  final Color activeColor;
  final Color inactiveColor;

  const CustomPageIndicator({
    super.key,
    required this.pageCount,
    required this.currentIndex,
    this.dotSize = 10.0,
    this.spacing = 8.0,
    this.activeColor = Colors.black,
    this.inactiveColor = const Color.fromARGB(147, 158, 158, 158),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        pageCount,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          width: dotSize,
          height: dotSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == currentIndex ? activeColor : inactiveColor,
          ),
        ),
      ),
    );
  }
}
