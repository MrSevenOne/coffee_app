import 'package:coffee_app/ui/core/themes/dark_theme.dart';
import 'package:flutter/material.dart';

class ThemeViewModel extends ChangeNotifier {
  ThemeData _currentTheme = AppDarkTheme.theme;
  bool _isDark = true;

  ThemeData get theme => _currentTheme;
  bool get isDark => _isDark;

  /// 🔁 Tema almashtirish (dark <-> light)
  void toggleTheme() {
    if (_isDark) {
      _currentTheme = ThemeData.light();
      _isDark = false;
    } else {
      _currentTheme = AppDarkTheme.theme;
      _isDark = true;
    }
    notifyListeners();
  }

  /// 🌑 Faqat dark temaga o‘tkazish
  void setDarkTheme() {
    _currentTheme = AppDarkTheme.theme;
    _isDark = true;
    notifyListeners();
  }

  /// ☀️ Faqat light temaga o‘tkazish
  void setLightTheme() {
    _currentTheme = ThemeData.light();
    _isDark = false;
    notifyListeners();
  }
}
