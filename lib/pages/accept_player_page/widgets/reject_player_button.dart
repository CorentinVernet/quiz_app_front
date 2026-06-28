import 'package:flutter/material.dart';
import '../../../i18n/generated/strings.g.dart';
import 'package:quiz_app_front/pages/matchmaking_page/matchmaking_page.dart';

class RejectPlayerButton extends StatelessWidget {
  const RejectPlayerButton({super.key});

  void _onRejectPlayerButtonPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MatchmakingPage()),
    );
  }

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(left: 20),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(218, 220, 66, 66),
        padding: EdgeInsets.only(left: 50, right: 50, top: 30, bottom: 30),
      ),
      child: Text(
        t.accept_player_page.reject_opponent,
        style: TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      onPressed: () => _onRejectPlayerButtonPressed(context),
    ),
  );
}
