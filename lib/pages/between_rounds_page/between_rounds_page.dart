import 'package:flutter/material.dart';
import 'package:quiz_app_front/pages/matchmaking_page/models/player.dart';
import 'package:quiz_app_front/pages/waiting_for_theme_page/waiting_for_theme_page.dart';

class CardColors {
  final Color textColor;
  final Color bgColor;

  Color getBgColor() => bgColor;
  Color getTextColor() => textColor;

  const CardColors({required this.textColor, required this.bgColor});
}

class BetweenRoundsPage extends StatefulWidget {
  final Player opponent;

  const BetweenRoundsPage({super.key, required this.opponent});

  @override
  State<StatefulWidget> createState() => BetweenRoundsPageState();
}

class BetweenRoundsPageState extends State<BetweenRoundsPage> with RouteAware {
  final status = <Map<String, Object>>[
    {
      "name": "1",
      "winners": ["opponent"],
    },
    {
      "name": "2",
      "winners": ["me", "opponent"],
    },
    {
      "name": "3",
      "winners": ["me"],
    },
    {"name": "4", "winners": []},
    {"name": "5", "winners": []},
  ];

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

            ...status.map((status) {
              CardColors meCardColors = _calculateMeColors(
                status["name"] as String,
                status["winners"] as List<dynamic>,
              );
              CardColors opponentCardColors = _calculateOpponentColors(
                status["name"] as String,
                status["winners"] as List<dynamic>,
              );

              return Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Text(
                        status["name"] as String,
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
            Container(
              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            WaitingForThemePage(opponent: widget.opponent),
                      ),
                    ),
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 137, 187, 116),
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                  ),
                  child: Text('Manche suivante'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
