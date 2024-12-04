import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_theme.dart';

final themeNotifierProvider = ChangeNotifierProvider<ThemeNotifier>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppTheme.darkTheme;

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    if (_currentTheme == AppTheme.lightTheme) {
      _currentTheme = AppTheme.darkTheme;
    } else {
      _currentTheme = AppTheme.lightTheme;
    }
    notifyListeners();
  }
}
