import "package:flutter/material.dart";
import "../../../widgets/fade_button.dart";
import "../../../i18n/generated/strings.g.dart";

class StartGameButton extends StatelessWidget {
  final int firstPlayer;
  final void Function() onStartButtonPressed;

  const StartGameButton({
    super.key,
    required this.firstPlayer,
    required this.onStartButtonPressed,
  });

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    margin: EdgeInsets.all(50),
    child: FadeButtonWidget(
      fontSize: 30,
      text: t.choose_first_player_page.start_game,
      callback: onStartButtonPressed,
    ),
  );
}
