import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lingoia/core/constants/app_images.dart';
import 'package:lingoia/core/constants/app_routers.dart';
import 'package:lingoia/core/constants/app_strings.dart';
import 'package:lingoia/core/theme/app_colors.dart';
import 'package:lingoia/core/utils/media_query_helper.dart';
import 'package:lingoia/data/models/register_model.dart';
import 'package:lingoia/presentation/bloc/auth/auth_bloc.dart';
import 'package:lingoia/presentation/bloc/auth/auth_event.dart';
import 'package:lingoia/presentation/bloc/auth/auth_state.dart';
import 'package:lingoia/presentation/widgets/custom_button.dart';
import 'package:lingoia/presentation/widgets/custom_text_field.dart';
import 'package:lingoia/presentation/widgets/social_button.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQueryHelper(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título
              Text(
                AppStrings.createAccount,
                style: theme.textTheme.headlineLarge,
              ),
              const SizedBox(height: 0),
              const Text(
                AppStrings.signUpToGetStarted,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Campos de entrada
              CustomTextField(
                label: AppStrings.name,
                hint: AppStrings.enterName,
                icon: Icons.person,
                controller: nameController,
              ),
              CustomTextField(
                label: AppStrings.email,
                hint: AppStrings.enterEmail,
                icon: Icons.email,
                controller: emailController,
              ),
              CustomTextField(
                label: AppStrings.phone,
                hint: AppStrings.phonePlaceholder,
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                controller: phoneController,
              ),
              CustomTextField(
                label: AppStrings.password,
                hint: AppStrings.enterPassword,
                icon: Icons.lock,
                isPassword: true,
                controller: passwordController,
              ),
              CustomTextField(
                label: AppStrings.password,
                hint: AppStrings.enterPasswordAgain,
                icon: Icons.lock,
                isPassword: true,
                controller: repeatController,
              ),

              const SizedBox(height: 10),

              // Botón de Crear Cuenta
              BlocConsumer<AuthBloc, AuthState>(builder: (context, state) {
                if (state is AuthLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Center(
                  child: CustomButton(
                    color: AppColors.darkBackground,
                    text: AppStrings.createAccount,
                    textStyle: theme.textTheme.bodyMedium!
                        .copyWith(color: Colors.white),
                    width: mediaQuery.screenWidth * .7,
                    borderRadius: 30,
                    onPressed: () => _signupAction(context),
                  ),
                );
              }, listener: (context, state) {
                if (state is AuthError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                }

                if (state is AuthAuthenticated) {
                  GoRouter.of(context).go(AppRouters.chat);
                }
              }),

              const SizedBox(height: 10),

              // Texto de "O"
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      AppStrings.or,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 1,
                    color: Colors.grey[300],
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Botones de redes sociales
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(
                      iconPath: AppImages.googleIcon,
                      onPressed: () {
                        // Acción para iniciar sesión con Google
                      }),
                  const SizedBox(width: 16),
                  SocialButton(
                      iconPath: AppImages.appleIcon,
                      onPressed: () {
                        // Acción para iniciar sesión con Apple
                      }),
                  const SizedBox(width: 16),
                  SocialButton(
                      iconPath: AppImages.facebookIcon,
                      onPressed: () {
                        // Acción para iniciar sesión con Facebook
                      }),
                ],
              ),

              const SizedBox(height: 3),

              // Texto de "Ya tienes cuenta?"
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "${AppStrings.alreadyHaveAccount} ",
                    style: TextStyle(fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () => GoRouter.of(context).go(AppRouters.login),
                    child: Text(
                      AppStrings.logIn,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: AppColors.accent,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _signupAction(BuildContext context) {
    final errors = _validateData(
      name: nameController.text,
      email: emailController.text.trim(),
      password: passwordController.text,
      confirmPassword: repeatController.text,
    );

    if (errors.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errors.values.first)),
      );
      return;
    }

    RegisterModel registerModel = RegisterModel(
      name: nameController.text.trimLeft().trimRight(),
      email: emailController.text.trim(),
      password: passwordController.text,
      preferredLanguage: "en",
      level: 0,
    );

    return context.read<AuthBloc>().add(
          SignupRequested(
            registerModel: registerModel,
          ),
        );
  }

  bool _isValidEmail(String email) {
    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return emailRegex.hasMatch(email);
  }

  Map<String, String> _validateData({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    Map<String, String> errors = {};

    if (name.isEmpty || name.length < 3 || name.contains(RegExp(r"^[0-9]"))) {
      errors["name"] = "Ingrese un nombre valido";
    }

    if (email.isEmpty || !_isValidEmail(email)) {
      errors["email"] = "Ingrese un correo válido";
    }

    if (password.isEmpty || password.length < 6) {
      errors["password"] = "La contraseña debe tener al menos 6 caracteres";
    }

    if (confirmPassword.isEmpty || confirmPassword != password) {
      errors["confirmPassword"] = "Las contraseñas no coinciden";
    }

    return errors;
  }
}
