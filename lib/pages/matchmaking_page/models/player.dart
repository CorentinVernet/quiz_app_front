import 'package:quiz_app_front/shared_assets/themes.dart';

import '../../../shared_models/theme.dart';
import "dart:math";

Random _random = Random();

class Player {
  final String name;
  int totalScore;
  final bool isBot;
  Map<Theme, List<double>> historyOfAccuracyPerGame = {};
  Map<Theme, double> accuracyPerTheme = {};
  int totalPlayedGames;

  final Map<Theme, int> playedThemeOccurrences = {};

  Player({
    required this.name,
    required this.totalPlayedGames,
    required this.totalScore,
    required this.isBot,
    required this.accuracyPerTheme,
  });

  String getName() => name;
  int getTotalScore() => totalScore;
  bool getIsBot() => isBot;
  int getTotalPlayedGames() => totalPlayedGames;

  void updatePlayedThemes(Theme theme) =>
      playedThemeOccurrences[theme] = (playedThemeOccurrences[theme] ?? 0) + 1;

  Theme calculatePreferedTheme() {
    int localMax = 0;
    // If the player never played any game, then Initialize their prefered theme to a random one, like biology here.
    Theme preferedTheme = defaultTheme;

    for (Theme theme in themes) {
      int playedOccurrences = playedThemeOccurrences[theme]!;
      if (playedOccurrences > localMax) {
        localMax = playedOccurrences;
        preferedTheme = theme;
      }
    }
    return preferedTheme;
  }

  Theme chooseTheme() {
    // If the player never played any game, then Initialize their prefered theme to a random one, like biology here.
    double accuracyOnCurrentTheme = 0;
    List<Theme> chosenThemes = [];
    for (Theme theme in themes) {
      accuracyOnCurrentTheme = (accuracyPerTheme[theme] ?? 0);
      if (_random.nextDouble() < accuracyOnCurrentTheme) {
        chosenThemes.add(theme);
      }
    }
    return chosenThemes[_random.nextInt(chosenThemes.length)];
  }

  void addAccuracyEntryToATheme(Theme theme, double newAccuracy) =>
      historyOfAccuracyPerGame[theme] = (historyOfAccuracyPerGame[theme] ?? [])
        ..add(newAccuracy);

  void updateAverageAccuracyPerTheme() {
    for (Theme theme in themes) {
      double summedAccuraciesOnCurrentTheme =
          (historyOfAccuracyPerGame[theme] ?? []).reduce(
            (total, accuracy) => total + accuracy,
          );
      double newAccuracyOnThisTheme =
          summedAccuraciesOnCurrentTheme /
          (historyOfAccuracyPerGame[theme] ?? []).length;
      accuracyPerTheme[theme] = newAccuracyOnThisTheme;
    }
  }

  void addToTotalScore(int score) => totalScore += score;

  void addToTotalPlayedGames() => totalPlayedGames += 1;
}
