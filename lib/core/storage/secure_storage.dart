import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const _storage = FlutterSecureStorage();
  static SharedPreferences? _prefs;

  // Inicializar SharedPreferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Guardar token seguro
  static Future<void> saveToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  // Obtener token seguro
  static Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  // Eliminar token (Logout)
  static Future<void> removeToken() async {
    await _storage.delete(key: 'token');
  }

  // Guardar usuario en SharedPreferences
  static Future<void> saveUser(String userData) async {
    await _prefs?.setString('user', userData);
  }

  // Obtener usuario
  static String? getUser() {
    return _prefs?.getString('user');
  }

  // Eliminar usuario
  static Future<void> removeUser() async {
    await _prefs?.remove('user');
  }

  // Guardar idioma
  static Future<void> setLanguage(String language) async {
    await _prefs?.setString('language', language);
  }

  // Obtener idioma
  static String getLanguage() {
    return _prefs?.getString('language') ?? 'es';
  }

  // Guardar nivel de dificultad
  static Future<void> setDifficulty(int level) async {
    await _prefs?.setInt('difficulty', level);
  }

  // Obtener nivel de dificultad
  static int getDifficulty() {
    return _prefs?.getInt('difficulty') ?? 1;
  }
}