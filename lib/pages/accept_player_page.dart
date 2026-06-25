import 'package:flutter/material.dart';
import 'package:quiz_app_front/pages/choose_first_player_page.dart';
import 'package:quiz_app_front/pages/matchmaking_page.dart';
import '../widgets/fade_text.dart';

class PlaySessionPage extends StatelessWidget {
  const PlaySessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 60),
                child: const Text(
                  "Partie trouvée !",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40, left: 30, right: 30),
                child: Card(
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(top: 70, bottom: 70),
                      child: FadeTextWidget(
                        text: "'Nom de l'adversaire'",
                        fontSize: 50,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            218,
                            103,
                            215,
                            106,
                          ),
                          padding: EdgeInsets.only(
                            left: 50,
                            right: 50,
                            top: 30,
                            bottom: 30,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChooseFirstPlayerPage(
                                opponentName: "Jean-Louis",
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Accepter",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            218,
                            220,
                            66,
                            66,
                          ),
                          padding: EdgeInsets.only(
                            left: 50,
                            right: 50,
                            top: 30,
                            bottom: 30,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MatchmakingPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Rejeter",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
