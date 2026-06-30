// BottomNavigationBar already exists in the Flutter framework.
// Since this page does not use this one, then hide it to avoid a collision.
import 'package:flutter/material.dart' hide BottomNavigationBar, Theme;
import 'package:quiz_app_front/pages/accept_player_page/widgets/accept_player_label.dart';
import 'package:quiz_app_front/pages/accept_player_page/widgets/reject_player_button.dart';
import 'package:quiz_app_front/pages/accept_player_page/widgets/accept_player_button.dart';
import 'package:quiz_app_front/pages/accept_player_page/widgets/found_opponent_title.dart';
import 'package:quiz_app_front/pages/accept_player_page/widgets/bottom_navigation_bar.dart';
import 'package:quiz_app_front/pages/choose_first_player_page/choose_first_player_page.dart';
import 'package:quiz_app_front/pages/matchmaking_page/matchmaking_page.dart';
import 'package:quiz_app_front/pages/matchmaking_page/models/player.dart';
import 'package:quiz_app_front/shared_assets/themes.dart';

import '../../shared_models/theme.dart';

String opponentName = "Jean-Louis";

class AcceptPlayerPage extends StatelessWidget {
  final Player opponent;

  const AcceptPlayerPage({super.key, required this.opponent});

  void _onAcceptPlayerButtonPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChooseFirstPlayerPage(opponent: opponent),
      ),
    );
  }

  void _onRejectPlayerButtonPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MatchmakingPage()),
    );
  }

  String _displayAccuracyPerTheme() {
    String result = "";
    for (Theme theme in themes) {
      result +=
          '$theme: ${(opponent.accuracyPerTheme[theme.value]! * 100).toInt()}%\n';
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(),
      body: Center(
        child: Column(
          children: [
            FoundOpponentTitle(),
            AcceptPlayerLabel(
              opponentName:
                  '${opponent.name} \nPrécision:\n ${_displayAccuracyPerTheme()}',
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AcceptPlayerButton(
                    onAcceptPlayerButtonPressed: () =>
                        _onAcceptPlayerButtonPressed(context),
                  ),
                  // If the matched opponent is rejected, then try to find another one.
                  RejectPlayerButton(
                    onRejectPlayerButtonPressed: () =>
                        _onRejectPlayerButtonPressed(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
