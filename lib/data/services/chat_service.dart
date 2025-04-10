import 'package:signalr_core/signalr_core.dart';

class ChatService {
  late final HubConnection _connection;

  ChatService() {
    _connection = HubConnectionBuilder()
        .withUrl(
          'http://localhost:5000/chatHub', // Cambia por tu URL real
          HttpConnectionOptions(
            logging: (level, message) => print(message),
          ),
        )
        .build();
  }

  Future<void> connect() async {
    await _connection.start();
    print('Conectado al servidor SignalR');
  }

  Future<void> sendMessage(String user, String message) async {
    await _connection.invoke('SendMessage', args: [user, message]);
  }

  void onMessageReceived(Function(String user, String message) callback) {
    _connection.on('ReceiveMessage', (args) {
      if (args != null && args.length == 2) {
        callback(args[0] as String, args[1] as String);
      }
    });
  }

  Future<void> disconnect() async {
    await _connection.stop();
    print('Desconectado del servidor SignalR');
  }
}