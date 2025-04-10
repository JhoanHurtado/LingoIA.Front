import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lingoia/core/constants/app_images.dart';
import 'package:lingoia/core/constants/app_routers.dart';
import 'package:lingoia/core/constants/app_strings.dart';
import 'package:lingoia/core/theme/app_colors.dart';
import 'package:lingoia/presentation/widgets/custom_avatar.dart';
import 'package:lingoia/presentation/widgets/custom_badge.dart';
import 'package:lingoia/presentation/widgets/custom_button.dart';
import 'package:lingoia/presentation/widgets/custom_page_indicator.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const SizedBox(height: 0),
            Column(
              children: [
                const CustomAvatar(
                  avatarPath: AppImages.defaultAvatar,
                  customBadge: CustomBadge(
                    badgePath: AppImages.badgeIconSound,
                    badgeBackgroundColor: Colors.white,
                    badgeShadowBlur: 4.0,
                    badgeShadowColor: Colors.black26,
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    Text(
                      AppStrings.startPageTitle,
                      style: theme.textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 7),
                    Text(
                      AppStrings.startPageSubtitle,
                      style: theme.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                CustomPageIndicator(
                  activeColor: AppColors.darkBackground,
                  dotSize: 8,
                  spacing: 5,
                  pageCount: 4,
                  currentIndex: 0, // Cambia esto dinámicamente
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: AppStrings.getStarted,
                  textStyle: theme.textTheme.bodySmall!.copyWith(
                    color: AppColors.background,
                    fontWeight: FontWeight.bold,
                  ),
                  color: AppColors.primary,
                  width: MediaQuery.of(context).size.width * 0.6,
                  borderRadius: 30,
                  onPressed: () {
                    context.go(AppRouters.login);
                  },
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: "${AppStrings.alreadyHaveAccount} ",
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: AppColors.primary),
                    children: [
                      TextSpan(
                        text: AppStrings.signIn,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.accent, // Color de acento
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
