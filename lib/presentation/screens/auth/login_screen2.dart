import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lingoia/core/constants/app_images.dart';
import 'package:lingoia/core/constants/app_routers.dart';
import 'package:lingoia/core/constants/app_strings.dart';
import 'package:lingoia/core/theme/app_colors.dart';
import 'package:lingoia/core/utils/media_query_helper.dart';
import 'package:lingoia/data/models/login_model.dart';
import 'package:lingoia/presentation/bloc/auth/auth_bloc.dart';
import 'package:lingoia/presentation/bloc/auth/auth_event.dart';
import 'package:lingoia/presentation/bloc/auth/auth_state.dart';
import 'package:lingoia/presentation/widgets/custom_avatar.dart';
import 'package:lingoia/presentation/widgets/custom_button.dart';
import 'package:lingoia/presentation/widgets/custom_text_field.dart';
import 'package:lingoia/presentation/widgets/social_button.dart';

class LoginScreen2 extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQueryHelper(context);
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                  horizontal: mediaQuery.widthPercentage(5)),
              child: SizedBox(
                height: mediaQuery.screenHeight - 60,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Sección 1: Títulos
                    Text(
                      AppStrings.login,
                      style: theme.textTheme.headlineLarge,
                    ),
                    Text(
                      AppStrings.loginToGetStarted,
                      style: theme.textTheme.bodyMedium,
                    ),

                    SizedBox(height: mediaQuery.heightPercentage(5)),

                    // Sección 2: Avatar
                    Center(
                      child: CustomAvatar(
                        avatarPath: AppImages.defaultAvatar,
                        size: mediaQuery.widthPercentage(40),
                      ),
                    ),
                    SizedBox(height: mediaQuery.heightPercentage(5)),

                    // Sección 3: Formulario y Botones
                    CustomTextField(
                      label: AppStrings.email,
                      hint: AppStrings.enterEmail,
                      icon: Icons.email,
                      labelColor: AppColors.primary,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                    ),

                    CustomTextField(
                      label: AppStrings.password,
                      hint: AppStrings.enterPassword,
                      icon: Icons.lock,
                      labelColor: AppColors.primary,
                      isPassword: true,
                      controller: passwordController,
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => print(AppStrings.forgotPassword),
                        child: Text(
                          AppStrings.forgotPassword,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: mediaQuery.heightPercentage(2)),

                    ///### Sección 4: Botón de Iniciar Sesión
                    Center(
                      child: CustomButton(
                        text: AppStrings.getStarted,
                        color: AppColors.darkBackground,
                        textStyle: theme.textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                        width: mediaQuery.screenWidth * .7,
                        borderRadius: 30,
                        onPressed: () {
                          final email = emailController.text;
                          final password = passwordController.text;

                          return context.read<AuthBloc>().add(LoginRequested(
                              loginModel: LoginModel(
                                  email: email, password: password),),);
                        },
                      ),
                    ),

                    SizedBox(height: mediaQuery.heightPercentage(2)),

                    // Separador
                    Center(
                      child: Column(
                        children: [
                          Text(
                            AppStrings.or,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          Text(
                            AppStrings.loginWith,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppColors.darkBackground,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: mediaQuery.heightPercentage(1)),

                    // Botones de Redes Sociales
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialButton(
                          iconPath: AppImages.googleIcon,
                          onPressed: () => print("Google Login"),
                        ),
                        SizedBox(width: mediaQuery.widthPercentage(5)),
                        SocialButton(
                          iconPath: AppImages.appleIcon,
                          onPressed: () => print("Apple Login"),
                        ),
                        SizedBox(width: mediaQuery.widthPercentage(5)),
                        SocialButton(
                          iconPath: AppImages.facebookIcon,
                          onPressed: () => print("Facebook Login"),
                        ),
                      ],
                    ),

                    SizedBox(height: mediaQuery.heightPercentage(0)),

                    // Opción de Crear Cuenta
                    Center(
                      child: TextButton(
                        onPressed: () => print(AppStrings.createAccount),
                        child: Text.rich(
                          TextSpan(
                            text: "${AppStrings.dontHaveAccount} ",
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppColors.darkBackground,
                            ),
                            children: [
                              TextSpan(
                                text: AppStrings.createAccount,
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: AppColors.accent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: mediaQuery.heightPercentage(3),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
          if (state is AuthAuthenticated) {
            GoRouter.of(context).go(AppRouters.chat);
          }
        },
      ),
    );
  }
}
