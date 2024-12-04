import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


import '../../data/models/user_progress.dart';

class UserProgressStorage {

  static const String _usernameKey = 'username';

  Future<void> saveUsername(String username) async {

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usernameKey, username);
  }

  Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_usernameKey);
  }

  Future<void> saveUserProgress(UserProgress userProgress) async {
    final prefs = await SharedPreferences.getInstance();
    String jsonStr = userProgress.toJson();  // Convert to JSON string
    await prefs.setString('user_progress', jsonStr);  // Save to shared preferences
  }
  Future<UserProgress?> getUserProgress() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonStr = prefs.getString('user_progress');



    if (jsonStr != null) {
      return UserProgress.fromJson(jsonStr);  // Convert to UserProgress object
    }
    return null;  // Return null if no data is found
  }
  Future<void> clearUserProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_progress');  // Clear the saved user progress data
  }

}
