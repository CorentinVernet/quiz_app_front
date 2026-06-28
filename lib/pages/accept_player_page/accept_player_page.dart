import 'package:flutter/material.dart';
import 'package:quiz_app_front/pages/accept_player_page/widgets/accept_player_label.dart';
import 'package:quiz_app_front/pages/accept_player_page/widgets/reject_player_button.dart';
import 'package:quiz_app_front/pages/accept_player_page/widgets/accept_player_button.dart';
import 'package:quiz_app_front/pages/accept_player_page/widgets/found_opponent_title.dart';
import 'package:quiz_app_front/pages/accept_player_page/widgets/bottom_navigation_bar.dart';

String opponentName = "Jean-Louis";

class PlaySessionPage extends StatelessWidget {
  const PlaySessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AcceptPlayerPageBottomNavigationBar(),
      body: Center(
        child: Column(
          children: [
            AcceptPlayerPageFoundOpponentTitle(),
            AcceptPlayerLabel(opponentName: opponentName),
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AcceptPlayerButton(opponentName: opponentName),
                  // If the matched opponent is rejected, then try to find another one.
                  RejectPlayerButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
