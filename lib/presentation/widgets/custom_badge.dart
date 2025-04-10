import 'package:flutter/material.dart';
import 'package:lingoia/core/constants/app_sizes.dart';

class CustomBadge extends StatelessWidget {
  final String badgePath;
  final double? bottom;
  final double? right;
  final double? widthImage;
  final double? heightImage;
  final Color badgeBackgroundColor;
  final double badgeShadowBlur;
  final Color badgeShadowColor;
  final BoxShape? shape;

  const CustomBadge(
      {super.key,
      required this.badgePath,
      this.bottom,
      this.right,
      this.widthImage,
      this.heightImage,
      required this.badgeBackgroundColor,
      required this.badgeShadowBlur,
      required this.badgeShadowColor,
      this.shape});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom ?? 0,
      right: right ?? 0,
      child: Container(
        decoration: BoxDecoration(
          color: badgeBackgroundColor,
          shape: shape ?? BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: badgeShadowColor,
              blurRadius: badgeShadowBlur,
              spreadRadius: 0,
            ),
          ],
        ),
        padding: const EdgeInsets.all(AppSizes.defaultPadding),
        child: ClipOval(
          child: Image.asset(
            badgePath,
            width: widthImage ?? AppSizes.defaultBadgeSize,
            height: heightImage ?? AppSizes.defaultBadgeSize,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
