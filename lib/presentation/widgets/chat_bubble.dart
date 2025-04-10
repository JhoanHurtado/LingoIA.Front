import 'package:flutter/material.dart';
import 'package:lingoia/core/constants/app_images.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String? correction;
  final bool isUser;

  const ChatBubble({
    required this.message,
    required this.isUser,
    this.correction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!isUser)
                const CircleAvatar(
                  backgroundImage: AssetImage(AppImages.defaultAvatar),
                ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isUser ? theme.hintColor : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  message,
                  style: TextStyle(
                      color: isUser ? Colors.white : Colors.black87,
                      decoration: correction != null
                          ? TextDecoration.lineThrough
                          : null,
                      decorationColor: Colors.red,
                      decorationThickness: 2),
                ),
              ),
            ],
          ),
          if (correction != null)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                correction!,
                style: theme.textTheme.labelSmall,
              ),
            ),
        ],
      ),
    );
  }
}
