import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingoia/data/services/chat_service.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatService _chatService;
  final List<String> _messages = [];

  ChatBloc(this._chatService) : super(ChatInitial()) {
    on<ConnectToChat>(_onConnectToChat);
    on<SendMessage>(_onSendMessage);
    on<MessageReceived>(_onMessageReceived);
  }

  Future<void> _onConnectToChat(ConnectToChat event, Emitter<ChatState> emit) async {
    await _chatService.connect();
    _chatService.onMessageReceived((user, message) {
      add(MessageReceived(user, message));
    });
    emit(ChatConnected());
  }

  Future<void> _onSendMessage(SendMessage event, Emitter<ChatState> emit) async {
    await _chatService.sendMessage(event.user, event.message);
  }

  void _onMessageReceived(MessageReceived event, Emitter<ChatState> emit) {
    _messages.add('${event.user}: ${event.message}');
    emit(ChatMessageReceived(List.from(_messages)));
  }
}