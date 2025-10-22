import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  /// 🎨 Tez kirish uchun theme qisqartmalari
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// 📱 Ekran o‘lchamlariga tez kirish
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  /// 🧭 Navigatsiya helperlari
  void push(Widget page) {
    Navigator.push(this, MaterialPageRoute(builder: (_) => page));
  }

  void pushReplacement(Widget page) {
    Navigator.pushReplacement(this, MaterialPageRoute(builder: (_) => page));
  }

  void pop() => Navigator.pop(this);

  /// 🔔 Snackbar chiqarish
  void showSnack(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
