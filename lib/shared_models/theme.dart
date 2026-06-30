import 'dart:ui';

enum ThemeValue {
  history,
  geography,
  music,
  biology,
  literature,
  mathematics,
  entertainment,
  physicsChemistry,
}

class Theme {
  final ThemeValue value;
  final Color color;

  const Theme({required this.value, required this.color});

  static ThemeValue? themeFromString(String themeKey) =>
      ThemeValue.values.where((theme) => theme.name == themeKey).firstOrNull;
}
