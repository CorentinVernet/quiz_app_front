import 'package:flutter/material.dart';
import '../../../i18n/generated/strings.g.dart';
import 'package:quiz_app_front/pages/choose_first_player_page.dart';

class AcceptPlayerButton extends StatelessWidget {
  final String opponentName;

  const AcceptPlayerButton({super.key, required this.opponentName});

  void _onAcceptPlayerButtonPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChooseFirstPlayerPage(opponentName: opponentName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(right: 10),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(218, 103, 215, 106),
        padding: EdgeInsets.only(left: 50, right: 50, top: 30, bottom: 30),
      ),
      child: Text(
        t.accept_player_page.accept_opponent,
        style: TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      onPressed: () => _onAcceptPlayerButtonPressed(context),
    ),
  );
}
