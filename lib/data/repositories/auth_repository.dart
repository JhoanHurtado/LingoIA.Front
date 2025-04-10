import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lingoia/core/constants/app_url.dart';
import 'package:lingoia/data/models/login_model.dart';
import 'package:lingoia/data/models/register_model.dart';
import '../models/user_model.dart';

class AuthRepository {
  final Dio dio = Dio();
  final String baseUrl = "${AppUrl.apiUrlBack}auth";
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<UserModel> login(LoginModel loginModel) async {
    try {
      Response response = await dio.post(
        "$baseUrl/login",
        data: {"email": loginModel.email, "password": loginModel.password},
      );

      final user = UserModel.fromJson(response.data);

      // Guardar token y datos del usuario en SecureStorage
      await secureStorage.write(key: "name", value: user.name);
      await secureStorage.write(key: "token", value: user.token);
      await secureStorage.write(key: "email", value: user.email);
      await secureStorage.write(key: "id", value: user.id);
      await secureStorage.write(
          key: "preferredLanguage", value: user.preferredLanguage);
      await secureStorage.write(key: "level", value: user.level.toString());
      await secureStorage.write(
          key: "createdAt", value: user.createdAt.toString());

      return user;
    } catch (e) {
      throw Exception("Error al iniciar sesión");
    }
  }

  Future<UserModel> signup(RegisterModel registerModel) async {
    try {
      Response response = await dio.post(
        "$baseUrl/register",
        data: registerModel.toJson(),
      );

      final user = UserModel.fromJson(response.data);

      // Guardar token y datos del usuario en SecureStorage
      await secureStorage.write(key: "name", value: user.name);
      await secureStorage.write(key: "token", value: user.token);
      await secureStorage.write(key: "email", value: user.email);
      await secureStorage.write(key: "id", value: user.id);
      await secureStorage.write(
          key: "preferredLanguage", value: user.preferredLanguage);
      await secureStorage.write(key: "level", value: user.level.toString());
      await secureStorage.write(
          key: "createdAt", value: user.createdAt.toString());

      return user;
    } catch (e) {
      throw Exception("Error al iniciar sesión");
    }
  }

  Future<UserModel?> getUser() async {
    final id = await secureStorage.read(key: "id");
    final email = await secureStorage.read(key: "email");
    final token = await secureStorage.read(key: "token");
    final name = await secureStorage.read(key: "name");
    final preferredLanguage =
        await secureStorage.read(key: "preferredLanguage");
    final level = await secureStorage.read(key: "level");
    final createdAt = await secureStorage.read(key: "createdAt");

    if (id != null && email != null && token != null && name != null) {
      return UserModel(
          id: id,
          email: email,
          token: token,
          name: name,
          preferredLanguage: preferredLanguage!,
          level: int.tryParse(level!)!,
          createdAt: createdAt != null ? DateTime.tryParse(createdAt) : null);
    }
    return null;
  }

  Future<void> logout() async {
    await secureStorage.deleteAll(); // Eliminar datos de usuario
  }

  Future<bool> isUserLoggedIn() async {
    String? token = await secureStorage.read(key: "token");
    return token != null;
  }

  Future<String?> getUserToken() async {
    return await secureStorage.read(key: "token");
  }
}
