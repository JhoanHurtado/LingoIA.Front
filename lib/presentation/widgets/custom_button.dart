import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final TextStyle textStyle;
  final double width;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.textStyle,
    required this.width,
    this.color = Colors.black,
    this.textColor = Colors.white,
    this.borderRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
