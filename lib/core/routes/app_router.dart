import 'package:go_router/go_router.dart';
import 'package:lingoia/core/constants/app_routers.dart';
import 'package:lingoia/presentation/screens/chat/chat_screen.dart';
import 'package:lingoia/presentation/screens/auth/login_screen.dart';
import 'package:lingoia/presentation/screens/auth/sign_up_screen.dart';
import 'package:lingoia/presentation/screens/start_screen.dart';
import 'package:lingoia/presentation/screens/chat/voice_chat_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRouters.start,
    routes: [
      // GoRoute(
      //   path: AppRouters.home,
      //   builder: (context, state) => HomeScreen(),
      // ),

      GoRoute(
        path: AppRouters.start,
        builder: (context, state) => StartPage(),
      ),
      GoRoute(
        path: AppRouters.login,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: AppRouters.signUp,
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        path: AppRouters.chat,
        builder: (context, state) => ChatScreen(),
      ),
      GoRoute(
        path: AppRouters.voiceChat,
        builder: (context, state) => VoiceChatScreen(),
      ),
    ],
  );
}
