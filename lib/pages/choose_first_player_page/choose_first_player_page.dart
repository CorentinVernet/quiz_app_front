import "dart:math";
import "dart:async";
import 'package:flutter/material.dart';
import 'package:quiz_app_front/i18n/generated/strings.g.dart';
import 'package:quiz_app_front/pages/choose_first_player_page/widgets/my_card.dart';
import 'package:quiz_app_front/pages/choose_first_player_page/widgets/vs_label.dart';
import 'package:quiz_app_front/pages/choose_first_player_page/widgets/top_icon.dart';
import 'package:quiz_app_front/pages/choose_first_player_page/widgets/opponent_card.dart';
import 'package:quiz_app_front/pages/choose_first_player_page/widgets/start_game_button.dart';
import 'package:quiz_app_front/pages/choose_first_player_page/widgets/choose_first_player_label.dart';
import 'package:quiz_app_front/pages/choose_theme_page/choose_theme_page.dart';
import 'package:quiz_app_front/pages/matchmaking_page/models/player.dart';
import 'package:quiz_app_front/pages/waiting_for_theme_page/waiting_for_theme_page.dart';

class ChooseFirstPlayerPage extends StatefulWidget {
  final Player opponent;

  const ChooseFirstPlayerPage({super.key, required this.opponent});

  @override
  State<ChooseFirstPlayerPage> createState() => ChooseFirstPlayerPageState();
}

class ChooseFirstPlayerPageState extends State<ChooseFirstPlayerPage> {
  bool isButtonDisplayed = false;

  Color meBgColor = Colors.white70;
  Color opponentBgColor = Colors.white70;

  Color meTextColor = Colors.black;
  Color opponentTextColor = Colors.black;

  int firstPlayer = 0;

  @override
  void initState() {
    super.initState();
    firstPlayer = Random().nextInt(2);
    int count = 0;
    int maxCount = 6 + firstPlayer;

    // When the user enters the page, then display a blinking animation between the 2 opponents in order to simulate a random choice of the first player.
    Future.delayed(const Duration(seconds: 1), () {
      Timer.periodic(const Duration(milliseconds: 200), (timer) {
        count++;
        if (count <= maxCount) {
          setState(() {
            // Alternate between primary and white background colors.
            if (meBgColor == Colors.white70) {
              meBgColor = Colors.purple;
              meTextColor = Colors.white;
              opponentBgColor = Colors.white70;
              opponentTextColor = Colors.black;
            } else {
              meBgColor = Colors.white70;
              meTextColor = Colors.black;
              opponentBgColor = Colors.purple;
              opponentTextColor = Colors.white;
            }
          });
        } else {
          timer.cancel();
          setState(() => isButtonDisplayed = true);
        }
      });
    });
  }

  void _onStartButtonPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          if (firstPlayer == 1) {
            return ChooseThemePage(
              roundName: t.shared.round_names.first_round_name,
              opponent: widget.opponent,
            );
          } else {
            return WaitingForThemePage(opponent: widget.opponent);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopIcon(),
          ChooseFirstPlayerLabel(),
          OpponentCard(
            opponentBgColor: opponentBgColor,
            opponentName: widget.opponent.name,
            opponentTextColor: opponentTextColor,
          ),
          VsLabel(),
          MyCard(meBgColor: meBgColor, meTextColor: meTextColor),
          if (isButtonDisplayed)
            StartGameButton(
              firstPlayer: firstPlayer,
              onStartButtonPressed: () => _onStartButtonPressed(context),
            ),
        ],
      ),
    );
  }
}
