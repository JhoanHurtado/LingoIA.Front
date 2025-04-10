import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static const String languageKey = "language";
  static const String difficultyLevelKey = "difficulty";

  Future<void> setLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(languageKey, language);
  }

  Future<String?> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(languageKey);
  }

  Future<void> setDifficultyLevel(String level) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(difficultyLevelKey, level);
  }

  Future<String?> getDifficultyLevel() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(difficultyLevelKey);
  }
}