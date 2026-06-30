import 'package:flutter/material.dart' hide Theme;
import '../shared_models/theme.dart';

// If the player (user or bot) has never played any game, then assign a default theme.
// The biology theme here is random, any other theme would work.
const defaultTheme = Theme(color: Colors.green, value: ThemeValue.biology);

const List<Theme> themes = [
  Theme(color: Colors.green, value: ThemeValue.biology),
  Theme(color: Colors.blue, value: ThemeValue.geography),
  Theme(color: Colors.red, value: ThemeValue.mathematics),
  Theme(color: Colors.purple, value: ThemeValue.literature),
  Theme(color: Colors.orange, value: ThemeValue.entertainment),
  Theme(color: Colors.teal, value: ThemeValue.physicsChemistry),
  Theme(color: Colors.brown, value: ThemeValue.history),
];
