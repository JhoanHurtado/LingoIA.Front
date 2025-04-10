import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Acción al presionar el botón
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(52, 0, 0, 0),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: SvgPicture.asset(
          iconPath,
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}