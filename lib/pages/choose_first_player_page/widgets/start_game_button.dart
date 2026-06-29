import "package:flutter/material.dart";
import "../../../widgets/fade_button.dart";
import "../../../i18n/generated/strings.g.dart";
import "package:quiz_app_front/pages/choose_theme_page/choose_theme_page.dart";
import "package:quiz_app_front/pages/waiting_for_theme_page/waiting_for_theme_page.dart";

class StartGameButton extends StatelessWidget {
  final int firstPlayer;

  const StartGameButton({super.key, required this.firstPlayer});

  void _onStartButtonPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          if (firstPlayer == 1) {
            return ChooseThemePage(
              roundName: t.shared.round_names.first_round_name,
            );
          } else {
            return WaitingForThemePage();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    margin: EdgeInsets.all(50),
    child: FadeButtonWidget(
      fontSize: 30,
      text: t.choose_first_player_page.start_game,
      callback: () => _onStartButtonPressed(context),
    ),
  );
}
