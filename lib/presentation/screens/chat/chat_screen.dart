import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:lingoia/core/constants/app_routers.dart';
import 'package:lingoia/core/theme/app_colors.dart';
import 'package:lingoia/data/models/message_model.dart';
import 'package:lingoia/presentation/widgets/chat_bubble.dart';
import 'package:lingoia/presentation/widgets/templates/base_screen.dart';
import 'package:lingoia/presentation/widgets/custom_alert_dialog.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  List<Map<String, dynamic>> messages = [];
  Socket? _socket;
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    _initSocket();
  }

  Future<void> _initSocket() async {
    try {
      _socket = await Socket.connect("192.168.20.23", 5050);
      setState(() => _isConnected = true);

      _socket!.listen(
        (data) {
          String response = utf8.decode(data);
          MessageModel mesg = MessageModel.fromJson(json.decode(response));
          print("📩 Respuesta del servidor: $response");
          setState(() {
            messages.add({'text': mesg.correctedText, 'isUser': false});
          });
        },
        onError: (error) {
          print("❌ Error en el socket: $error");
          _socket?.destroy();
          setState(() => _isConnected = false);
        },
        onDone: () {
          //print("❌ Desconectado del servidor");
          //setState(() => _isConnected = false);
        },
      );
    } catch (e) {
      print("❌ No se pudo conectar al servidor: $e");
    }
  }

  Future<void> _sendMessage() async {
    final text = _messageController.text.trim();
    if (text.isEmpty || _socket == null || !_isConnected) return;

    const String language = "en";
    setState(() {
      messages.add({'text': text, 'isUser': true});
    });

    try {
      var jsonMessage = MessageModel(
        user: await secureStorage.read(key: "id"),
        sender: 1,
        text: text,
        score: 1,
        createdAt: DateTime.now(),
        token: await secureStorage.read(key: "token"),
      );
      _socket!.write(json.encode(jsonMessage.toJson()));
    } catch (e) {
      print("❌ Error al enviar el mensaje: $e");
    }
    _messageController.clear();
  }

  @override
  void dispose() {
    _socket?.destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CustomAlertDialog(
                          title: "Corrige el mensaje",
                          message:
                              "Escribe la corrección para el mensaje seleccionado.",
                          isInput: true,
                          confirmText: "Corregir",
                          cancelText: "Cancelar",
                          onConfirm: (String inputText) {
                            setState(() {
                              messages[index]['correction'] = inputText;
                            });
                          },
                        );
                      },
                    );
                  },
                  child: ChatBubble(
                    message: messages[index]['text'],
                    correction: messages[index]['correction'],
                    isUser: messages[index]['isUser'],
                  ),
                );
              },
            ),
          ),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.only(bottom: 12.0),
      color: AppColors.background,
      child: Row(
        children: [
          const SizedBox(width: 5),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: "Escribe un mensaje...",
                filled: true,
                fillColor: AppColors.background,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 7),
          GestureDetector(
            onLongPress: () {
              context.go(AppRouters.voiceChat);
            },
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 25, 34, 42),
              child: IconButton(
                icon: const Icon(Icons.send,
                    color: AppColors.background, size: 20),
                onPressed: _sendMessage,
              ),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
