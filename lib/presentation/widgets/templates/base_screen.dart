import 'package:flutter/material.dart';
import 'package:lingoia/core/constants/app_images.dart';
import 'package:lingoia/core/constants/app_strings.dart';
import 'package:lingoia/core/theme/app_colors.dart';
import 'package:lingoia/core/utils/media_query_helper.dart';
import 'package:lingoia/presentation/widgets/custom_avatar.dart';

class BaseScreen extends StatelessWidget {
  final Widget body;

  const BaseScreen({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQueryHelper(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          AppStrings.LingoIA,
          style: theme.textTheme.headlineLarge,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chat_bubble_outline),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CustomAvatar(
              avatarPath: AppImages.defaultAvatar,
              size: mediaQuery.widthPercentage(8),
            ),
          ),
        ],
      ),
      body: body,
    );
  }
}