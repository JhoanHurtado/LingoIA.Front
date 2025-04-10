class RegisterModel {
  final String name;
  final String email;
  final String password;
  final String? preferredLanguage;
  final int? level;

  RegisterModel({
    required this.name,
    required this.email,
    required this.password,
    required this.preferredLanguage,
    required this.level,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "preferredLanguage": preferredLanguage,
        "level": level,
      };
}
