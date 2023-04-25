import 'package:e_learning_app/puzzle_lib/src/ui/pages/game/game_view.dart';
import 'package:e_learning_app/puzzle_lib/src/ui/pages/privacy/privacy_view.dart';
import 'package:e_learning_app/puzzle_lib/src/ui/pages/splash/splash_view.dart';
import 'package:e_learning_app/puzzle_lib/src/ui/routes/routes.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.splash: (_) => const SplashView(),
    Routes.game: (_) => const GameView(),
    Routes.privacy: (_) => const PrivacyView(),
  };
}
