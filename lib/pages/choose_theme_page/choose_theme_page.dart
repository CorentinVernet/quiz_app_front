// Theme already exists in the Flutter framework.
// Since this page does not use this one, then hide it to avoid a collision.
import 'package:flutter/material.dart' hide Theme;
import 'package:quiz_app_front/pages/game_page/game_page.dart';
import 'package:quiz_app_front/pages/matchmaking_page/models/player.dart';
import "../../i18n/generated/strings.g.dart";
import 'package:quiz_app_front/pages/choose_theme_page/widgets/theme.dart'
    as listed_theme;
import 'package:quiz_app_front/pages/choose_theme_page/widgets/choose_theme_label.dart';

import '../../shared_assets/themes.dart';
import '../../shared_models/theme.dart';

class ChooseThemePage extends StatefulWidget {
  final String roundName;
  final Player opponent;

  const ChooseThemePage({
    super.key,
    required this.roundName,
    required this.opponent,
  });

  @override
  State<StatefulWidget> createState() => ChooseThemePageState();
}

class ChooseThemePageState extends State<ChooseThemePage> {
  void _onThemePressed(BuildContext context, Theme pressedTheme) => {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GamePage(
          roundName: widget.roundName,
          theme: pressedTheme,
          opponent: widget.opponent,
        ),
      ),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ChooseThemeLabel(),
              ...themes.map(
                (theme) => listed_theme.Theme(
                  roundName: widget.roundName,
                  themeName: t['shared.theme_names.${theme.value.name}'],
                  themeColor: theme.color,
                  onThemePressed: () => _onThemePressed(context, theme),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
