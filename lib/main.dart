import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingoia/core/routes/app_router.dart';
import 'package:lingoia/core/theme/app_theme.dart';
import 'package:lingoia/data/repositories/auth_repository.dart';
import 'package:lingoia/data/services/chat_service.dart';
import 'package:lingoia/domain/usecases/login_usecase.dart';
import 'package:lingoia/domain/usecases/register_usecase.dart';
import 'package:lingoia/presentation/bloc/auth/auth_bloc.dart';
import 'package:lingoia/presentation/bloc/auth/auth_event.dart';
import 'package:lingoia/presentation/bloc/chat/chat_bloc.dart';
import 'package:lingoia/presentation/bloc/chat/chat_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthBloc(
                loginUseCase: LoginUseCase(AuthRepository()),
                registerUseCase: RegisterUseCase(AuthRepository()),
                authRepository: AuthRepository())
              ..add(CheckAuthStatus())),
        BlocProvider(
          create: (context) => ChatBloc(ChatService())..add(ConnectToChat()),
        ),
      ],
      child: MaterialApp.router(
        title: 'LingoIA',
        debugShowCheckedModeBanner: false,
        theme: lingoIATheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
