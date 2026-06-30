import 'package:quiz_app_front/pages/matchmaking_page/assets/names.dart';
import 'package:quiz_app_front/pages/matchmaking_page/models/player.dart';
import 'package:quiz_app_front/shared_assets/themes.dart';
import "dart:math";

import 'package:quiz_app_front/shared_models/theme.dart';

final Random _random = Random();

String _findRandomName() => names[_random.nextInt(names.length)];

Map<Theme, double> _generateRandomAccuracyPerTheme() {
  Map<Theme, double> accuracyPerTheme = {};
  for (Theme theme in themes) {
    accuracyPerTheme[theme] = _random.nextDouble();
  }
  return accuracyPerTheme;
}

Player findOpponent() => Player(
  isBot: true,
  totalScore: 0,
  totalPlayedGames: 0,
  name: _findRandomName(),
  accuracyPerTheme: _generateRandomAccuracyPerTheme(),
);
