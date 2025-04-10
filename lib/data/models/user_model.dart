import 'dart:convert';

UserModel welcomeFromJson(String str) => UserModel.fromJson(json.decode(str));

String welcomeToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String id;
    String name;
    String email;
    String preferredLanguage;
    String token;
    int level;
    DateTime? createdAt;

    UserModel({
        required this.id,
        required this.name,
        required this.email,
        required this.preferredLanguage,
        required this.token,
        required this.level,
        this.createdAt,
    });

    UserModel copyWith({
        String? id,
        String? name,
        String? email,
        String? preferredLanguage,
        String? token,
        int? level,
    }) => 
        UserModel(
            id: id ?? this.id,
            name: name ?? this.name,
            email: email ?? this.email,
            preferredLanguage: preferredLanguage ?? this.preferredLanguage,
            token: token ?? this.token,
            level: level ?? this.level,
        );

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        preferredLanguage: json["preferredLanguage"],
        token: json["token"],
        level: json["level"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "preferredLanguage": preferredLanguage,
        "token": token,
        "level": level,
        "createdAt": createdAt!.toIso8601String(),
    };
}
