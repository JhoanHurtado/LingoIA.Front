import 'package:equatable/equatable.dart';

abstract class ChatState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChatInitial extends ChatState {}

class ChatConnected extends ChatState {}

class ChatDisconnected extends ChatState {}

class ChatMessageReceived extends ChatState {
  final List<String> messages;

  ChatMessageReceived(this.messages);

  @override
  List<Object?> get props => [messages];
}