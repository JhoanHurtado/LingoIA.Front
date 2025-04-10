import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ConnectToChat extends ChatEvent {}

class SendMessage extends ChatEvent {
  final String user;
  final String message;

  SendMessage(this.user, this.message);

  @override
  List<Object?> get props => [user, message];
}

class MessageReceived extends ChatEvent {
  final String user;
  final String message;

  MessageReceived(this.user, this.message);

  @override
  List<Object?> get props => [user, message];
}