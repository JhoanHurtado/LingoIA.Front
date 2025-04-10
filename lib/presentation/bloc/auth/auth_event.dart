import 'package:lingoia/data/models/login_model.dart';
import 'package:lingoia/data/models/register_model.dart';

abstract class AuthEvent {}

class LoginRequested extends AuthEvent {
  final LoginModel loginModel;

  LoginRequested({required this.loginModel});
}

class SignupRequested extends AuthEvent {
  final RegisterModel registerModel;

  SignupRequested({required this.registerModel});
}

class LogoutRequested extends AuthEvent {}

class CheckAuthStatus extends AuthEvent {}
