import 'package:flutter/material.dart' hide Theme;
import 'package:quiz_app_front/i18n/generated/strings.g.dart';
import 'package:quiz_app_front/pages/between_rounds_page/widgets/next_round_button.dart';
import 'package:quiz_app_front/pages/choose_theme_page/choose_theme_page.dart';
import 'package:quiz_app_front/pages/end_game_page/end_game_page.dart';
import 'package:quiz_app_front/pages/matchmaking_page/models/player.dart';
import 'package:quiz_app_front/pages/waiting_for_theme_page/waiting_for_theme_page.dart';

import '../../shared_models/theme.dart';

class CardColors {
  final Color textColor;
  final Color bgColor;

  Color getBgColor() => bgColor;
  Color getTextColor() => textColor;

  const CardColors({required this.textColor, required this.bgColor});
}

class BetweenRoundsPage extends StatefulWidget {
  final Theme theme;
  final int roundIndex;
  final Player opponent;
  final int myCorrectAnswers;
  final int opponentCorrectAnswers;
  final bool isMyTurnToChooseTheme;

  const BetweenRoundsPage({
    super.key,
    required this.theme,
    required this.opponent,
    required this.roundIndex,
    required this.myCorrectAnswers,
    required this.isMyTurnToChooseTheme,
    required this.opponentCorrectAnswers,
  });

  @override
  State<StatefulWidget> createState() => BetweenRoundsPageState();
}

class BetweenRoundsPageState extends State<BetweenRoundsPage> with RouteAware {
  final winnerHistory = <Map<String, Object>>[];

  @override
  initState() {
    super.initState();
    if (widget.myCorrectAnswers == widget.opponentCorrectAnswers) {
      winnerHistory.add({
        "roundIndex": widget.roundIndex,
        "winners": ["me", "opponent"],
      });
    } else {
      if (widget.myCorrectAnswers > widget.opponentCorrectAnswers) {
        winnerHistory.add({
          "roundIndex": widget.roundIndex,
          "winners": ["me"],
        });
      } else {
        winnerHistory.add({
          "roundIndex": widget.roundIndex,
          "winners": ["opponent"],
        });
      }
    }
    _updateOpponentProfile();
  }

  void _updateOpponentProfile() {
    widget.opponent.addAccuracyEntryToATheme(
      widget.theme,
      widget.opponentCorrectAnswers / 5,
    );
    widget.opponent.updateAverageAccuracyPerTheme();
    widget.opponent.updatePlayedThemes(widget.theme);
  }

  bool _isNotPlayedRound(List<dynamic> winners) => winners.isEmpty;

  bool _isMewinner(List<dynamic> winners) =>
      winners.length == 1 && winners[0] == "me";

  bool _isOpponentWinner(List<dynamic> winners) =>
      winners.length == 1 && winners[0] == "opponent";

  bool _isBothWinners(List<dynamic> winners) => winners.length == 2;

  CardColors _calculateMeColors(String roundName, List<dynamic> winners) {
    if (_isNotPlayedRound(winners)) {
      return CardColors(textColor: Colors.grey, bgColor: Colors.white38);
    }
    if (_isMewinner(winners)) {
      return CardColors(textColor: Colors.white, bgColor: Colors.green);
    }
    if (_isBothWinners(winners)) {
      return CardColors(textColor: Colors.white, bgColor: Colors.green);
    } else {
      return CardColors(textColor: Colors.white, bgColor: Colors.red);
    }
  }

  CardColors _calculateOpponentColors(String roundName, List<dynamic> winners) {
    if (_isNotPlayedRound(winners)) {
      return CardColors(textColor: Colors.grey, bgColor: Colors.white38);
    }
    if (_isOpponentWinner(winners)) {
      return CardColors(textColor: Colors.white, bgColor: Colors.green);
    }
    if (_isBothWinners(winners)) {
      return CardColors(textColor: Colors.white, bgColor: Colors.green);
    } else {
      return CardColors(textColor: Colors.white, bgColor: Colors.red);
    }
  }

  void _onEndGameButtonPressed(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => EndGamePage(winners: _calculateGameWinner()),
    ),
  );

  void _onNextRoundButtonPressed(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget.isMyTurnToChooseTheme
          ? WaitingForThemePage(
              roundIndex: widget.roundIndex + 1,
              opponent: widget.opponent,
            )
          : ChooseThemePage(
              roundIndex: widget.roundIndex + 1,
              opponent: widget.opponent,
            ),
    ),
  );

  List<String> _calculateGameWinner() {
    int myWinnerRounds = 0;
    int opponentWinnerRounds = 0;
    for (Map<String, Object> roundHistory in winnerHistory) {
      List<String> winners = roundHistory["winners"] as List<String>;
      if (winners.length == 2) {
        myWinnerRounds++;
        opponentWinnerRounds++;
      } else {
        if (winners.length == 1) {
          if (winners[0] == "me") {
            myWinnerRounds++;
          }
          if (winners[0] == "opponent") {
            opponentWinnerRounds++;
          }
        }
      }
    }
    if (myWinnerRounds == 0 && opponentWinnerRounds == 0) {
      return [];
    }
    if (myWinnerRounds == opponentWinnerRounds) {
      return ["me", "opponent"];
    }
    if (myWinnerRounds > opponentWinnerRounds) {
      return ["me"];
    } else {
      return ["opponent"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 80, bottom: 10),
              child: Text(
                "Statut des manches",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40),
              ),
            ),

            ...winnerHistory.map((history) {
              CardColors meCardColors = _calculateMeColors(
                history["name"] as String,
                history["winners"] as List<dynamic>,
              );
              CardColors opponentCardColors = _calculateOpponentColors(
                history["name"] as String,
                history["winners"] as List<dynamic>,
              );

              return Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Text(
                        history["name"] as String,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Container(
                      width: 160,
                      height: 120,
                      margin: EdgeInsets.only(left: 30),
                      child: Card(
                        color: meCardColors.getBgColor(),
                        child: Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Me",
                              style: TextStyle(
                                color: meCardColors.getTextColor(),
                                fontSize: 25,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      width: 160,
                      height: 120,
                      margin: EdgeInsets.only(left: 30),
                      child: Card(
                        color: opponentCardColors.getBgColor(),
                        child: Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Opponent",
                              style: TextStyle(
                                color: opponentCardColors.getTextColor(),
                                fontSize: 25,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
            widget.roundIndex < 5
                ? NextRoundButton(
                    buttonLabel: t.between_rounds_page.next_round_label,
                    onNextRoundButtonPressed: () =>
                        _onNextRoundButtonPressed(context),
                  )
                : NextRoundButton(
                    buttonLabel: t.between_rounds_page.end_game_label,
                    onNextRoundButtonPressed: () =>
                        _onEndGameButtonPressed(context),
                  ),
          ],
        ),
      ),
    );
  }
}
