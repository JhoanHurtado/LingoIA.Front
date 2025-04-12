import 'dart:convert';

MessageModel messageFromJson(String str) =>
    MessageModel.fromJson(json.decode(str));

String messageToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
  final String? id;
  final String? user;
  final String? conversationId;
  final int? sender;
  final String? text;
  final String? correctedText;
  final double? score;
  final DateTime? createdAt;
  final String? token;
  final String? mispronouncedWord;
  final String? assistantResponse;
  final String? explanation;

  MessageModel({
    this.id,
    this.user,
    this.conversationId,
    this.sender,
    this.text,
    this.correctedText,
    this.score,
    this.createdAt,
    this.token,
    this.mispronouncedWord,
    this.assistantResponse,
    this.explanation,
  });

  MessageModel copyWith({
    String? id,
    String? user,
    String? conversationId,
    int? sender,
    String? text,
    String? correctedText,
    int? score,
    DateTime? createdAt,
    String? token,
    String? mispronouncedWord,
    String? assistantResponse,
    String? explanation,
  }) =>
      MessageModel(
        id: id ?? this.id,
        user: user ?? this.user,
        conversationId: conversationId ?? this.conversationId,
        sender: sender ?? this.sender,
        text: text ?? this.text,
        correctedText: correctedText ?? this.correctedText,
        score: this.score,
        createdAt: createdAt ?? this.createdAt,
        token: token ?? this.token,
        mispronouncedWord: mispronouncedWord ?? this.mispronouncedWord,
        assistantResponse: assistantResponse ?? this.assistantResponse,
        explanation: explanation ?? this.explanation,
      );

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        id: json["Id"],
        user: json["User"],
        conversationId: json["ConversationId"],
        sender: json["Sender"],
        text: json["Text"],
        correctedText: json["CorrectedText"],
        score: json["Score"],
        createdAt: json["CreatedAt"] == null
            ? null
            : DateTime.parse(json["CreatedAt"]),
        token: json["Token"],
        mispronouncedWord: json["MispronouncedWord"],
        assistantResponse: json["AssistantResponse"],
        explanation: json["Explanation"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "User": user,
        "ConversationId": conversationId,
        "Sender": sender,
        "Text": text,
        "CorrectedText": correctedText,
        "Score": score,
        "CreatedAt": createdAt?.toIso8601String(),
        "Token": token,
      };
}
