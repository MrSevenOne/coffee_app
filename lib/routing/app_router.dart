import 'package:coffee_app/ui/home/view_model/home_view_model.dart';
import 'package:coffee_app/ui/home/home_screen.dart';
import 'package:coffee_app/ui/nofound_screen.dart';
import 'package:coffee_app/ui/splash/widgets/splash_screen.dart';
import 'package:flutter/material.dart';
// Shu yerda sahifalaringni import qilasan:

class AppRouter {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String login = '/login';
  static const String settings = '/settings';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
          settings: settings,
        );

      case home:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
          settings: settings,
        );

      // case settings:
      //   return MaterialPageRoute(
      //     builder: (_) => const SettingsPage(),
      //     settings: settings,
      //   );

      default:
        // Not found sahifasi (404)
        return MaterialPageRoute(
          builder: (_) => NofoundScreen(),
          settings: settings,
        );
    }
  }
}
