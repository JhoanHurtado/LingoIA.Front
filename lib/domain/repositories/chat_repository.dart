abstract class ChatRepository {
  Future<void> connect();
  Future<void> sendMessage(String user, String message);
  void onMessageReceived(Function(String user, String message) callback);
  Future<void> disconnect();
}