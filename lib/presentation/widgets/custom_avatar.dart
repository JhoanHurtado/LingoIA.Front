import 'package:flutter/material.dart';
import 'package:lingoia/presentation/widgets/custom_badge.dart';

class CustomAvatar extends StatelessWidget {
  final String avatarPath;
  final double size;
  final Color badgeBackgroundColor;
  final double badgeShadowBlur;
  final Color badgeShadowColor;
  final CustomBadge? customBadge;

  const CustomAvatar({
    super.key,
    required this.avatarPath,
    this.size = 200,
    this.badgeBackgroundColor = Colors.white,
    this.badgeShadowBlur = 4.0,
    this.badgeShadowColor = Colors.black26,
    this.customBadge,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipOval(
          child: Image.asset(
            avatarPath,
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
        ),
        if (customBadge != null) customBadge!
      ],
    );
  }
}
