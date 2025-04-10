import 'package:lingoia/data/services/chat_service.dart';

import '../../domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatService _chatService;

  ChatRepositoryImpl(this._chatService);

  @override
  Future<void> connect() => _chatService.connect();

  @override
  Future<void> sendMessage(String user, String message) => _chatService.sendMessage(user, message);

  @override
  void onMessageReceived(Function(String user, String message) callback) => _chatService.onMessageReceived(callback);

  @override
  Future<void> disconnect() => _chatService.disconnect();
}