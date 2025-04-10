import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingoia/domain/usecases/login_usecase.dart';
import 'package:lingoia/data/repositories/auth_repository.dart';
import 'package:lingoia/domain/usecases/register_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final AuthRepository authRepository;

  AuthBloc(
      {required this.loginUseCase,
      required this.registerUseCase,
      required this.authRepository})
      : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<SignupRequested>(_onSignUpRequested);
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<LogoutRequested>(_onLogoutRequested);
  }

  void _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await loginUseCase.execute(event.loginModel);
      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthError("Credenciales incorrectas"));
    }
  }

  void _onSignUpRequested(
      SignupRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await registerUseCase.execute(event.registerModel);
      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthError("Ocurrio un error con el registro"));
    }
  }

  void _onCheckAuthStatus(
      CheckAuthStatus event, Emitter<AuthState> emit) async {
    final isLoggedIn = await authRepository.isUserLoggedIn();
    if (isLoggedIn) {
      final user = await authRepository.getUser();
      emit(AuthAuthenticated(user!)); // Cargar usuario
    } else {
      emit(AuthUnauthenticated());
    }
  }

  void _onLogoutRequested(
      LogoutRequested event, Emitter<AuthState> emit) async {
    await authRepository.logout();
    emit(AuthUnauthenticated());
  }
}
