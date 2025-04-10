import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? placeholder;
  final IconData? icon;
  final bool isInput;
  final String confirmText;
  final String cancelText;
  final Color? confirmColor;
  final Color? cancelColor;
  final Function(String)? onConfirm;
  final VoidCallback? onCancel;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.message,
    this.placeholder,
    this.icon,
    this.isInput = false,
    this.confirmText = "Aceptar",
    this.cancelText = "Cancelar",
    this.confirmColor,
    this.cancelColor,
    this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Platform.isIOS
        ? CupertinoAlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) Icon(icon, size: 24),
                if (icon != null) const SizedBox(width: 8),
                Text(title),
              ],
            ),
            content: Column(
              children: [
                Text(message),
                if (isInput)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CupertinoTextField(
                      controller: controller,
                      placeholder: placeholder,
                    ),
                  ),
              ],
            ),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  onCancel?.call();
                  Navigator.pop(context);
                },
                child: Text(cancelText, style: TextStyle(color: cancelColor)),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  onConfirm?.call(controller.text);
                  Navigator.pop(context, controller.text);
                },
                child: Text(confirmText, style: TextStyle(color: confirmColor)),
              ),
            ],
          )
        : AlertDialog(
            title: Row(
              children: [
                if (icon != null) Icon(icon, size: 24),
                if (icon != null) const SizedBox(width: 8),
                Text(title),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(message),
                if (isInput)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(hintText: placeholder),
                    ),
                  ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  onCancel?.call();
                  Navigator.pop(context);
                },
                child: Text(cancelText, style: TextStyle(color: cancelColor)),
              ),
              TextButton(
                onPressed: () {
                  onConfirm?.call(controller.text);
                  Navigator.pop(context, controller.text);
                },
                child: Text(confirmText, style: TextStyle(color: confirmColor)),
              ),
            ],
          );
  }
}