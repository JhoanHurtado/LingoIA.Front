import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lingoia/core/constants/app_images.dart';
import 'package:lingoia/core/constants/app_routers.dart';
import 'package:lingoia/core/utils/media_query_helper.dart';
import 'package:lingoia/presentation/widgets/custom_alert_dialog.dart';
import 'package:lingoia/presentation/widgets/templates/base_screen.dart';

class VoiceChatScreen extends StatelessWidget {
  const VoiceChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQueryHelper(context);

    return BaseScreen(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar del usuario
          Center(
            child: CircleAvatar(
              radius: mediaQuery.widthPercentage(20),
              backgroundImage: const AssetImage(AppImages.defaultAvatar),
            ),
          ),
          const SizedBox(height: 20),
          // Onda de sonido (Placeholder)
          SizedBox(
            height: 60,
            child: Image.asset(AppImages.waveform),
          ),
          const SizedBox(height: 40),
          // Controles de grabación
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.mic, size: 32, color: Colors.black87),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => CustomAlertDialog(
                      title: "Grabando",
                      message: "Grabando audio...",
                      confirmText: "Detener",
                      confirmColor: Colors.red,
                      onConfirm: (_) => context.go(AppRouters.chat),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.close, size: 32, color: Colors.black87),
                onPressed: () => context.go(AppRouters.chat),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
