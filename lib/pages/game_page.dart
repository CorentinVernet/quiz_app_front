//import 'dart:async';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  final String roundName;

  const GamePage({super.key, required this.roundName});

  @override
  State<StatefulWidget> createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  int currentQuestion = 0;
  int greenAnswerIndex = -1;
  int redAnswerIndex = -1;

  final questions = <Map<String, Object>>[
    {
      "id": 1,
      "question":
          "Quel organite est souvent surnommé la « centrale énergétique » de la cellule ?",
      "options": ["La mitochondrie", "Le ribosome", "Le noyau", "Le lysosome"],
      "answer": 0,
    },
    {
      "id": 2,
      "question":
          "Quel scientifique a observé pour la première fois des « cellules » dans du liège en 1665 ?",
      "options": [
        "Antonie van Leeuwenhoek",
        "Theodor Schwann",
        "Robert Hooke",
        "Louis Pasteur",
      ],
      "answer": 2,
    },
    {
      "id": 3,
      "question":
          "Quel organite contient la majeure partie de l'ADN d'une cellule eucaryote ?",
      "options": [
        "L'appareil de Golgi",
        "Le cytoplasme",
        "Le réticulum endoplasmique",
        "Le noyau",
      ],
      "answer": 3,
    },
    {
      "id": 4,
      "question":
          "Quelle structure délimite la cellule et contrôle les échanges avec l'extérieur ?",
      "options": [
        "La lame basale",
        "Le cytosquelette",
        "La paroi cellulaire",
        "La membrane plasmique",
      ],
      "answer": 3,
    },
    {
      "id": 5,
      "question": "Les ribosomes sont le siège de quel processus cellulaire ?",
      "options": [
        "La respiration cellulaire",
        "La réplication de l'ADN",
        "La synthèse des protéines",
        "La photosynthèse",
      ],
      "answer": 2,
    },
  ];

  void onAnswerClicked(int cardIndex) {
    int correctAnswerIndex = questions[currentQuestion]["answer"] as int;
    if (correctAnswerIndex == cardIndex) {
      setState(() {
        greenAnswerIndex = cardIndex;
        // This improves code robustness.
        // Red aswer should aleready equal -1 here.
        redAnswerIndex = -1;
      });
    } else {
      setState(() {
        redAnswerIndex = cardIndex;
        greenAnswerIndex = correctAnswerIndex;
      });
    }

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        if (currentQuestion < 4) {
          currentQuestion++;
        } else {}
        redAnswerIndex = -1;
        greenAnswerIndex = -1;
      });
    });
  }

  Color calculateCardColor(int cardIndex) => greenAnswerIndex == cardIndex
      ? Colors.green
      : redAnswerIndex == cardIndex
      ? Colors.red
      : Colors.white70;

  Color calculateAnswerTextColor(int cardIndex) {
    Color cardColor = calculateCardColor(cardIndex);
    return cardColor != Colors.white70 ? Colors.white : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(40),
              child: Text(widget.roundName, style: TextStyle(fontSize: 50)),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 100),
              child: Text(
                (questions[currentQuestion]["question"] as String),
                style: TextStyle(fontSize: 35),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        width: 200,
                        height: 200,
                        child: Card(
                          color: calculateCardColor(0),
                          child: InkWell(
                            onTap: () {
                              onAnswerClicked(0);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 6,
                                  (questions[currentQuestion]["options"]
                                      as List<String>)[0],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: calculateAnswerTextColor(0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Card(
                          color: calculateCardColor(1),
                          child: InkWell(
                            onTap: () {
                              onAnswerClicked(1);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 6,
                                  (questions[currentQuestion]["options"]
                                      as List<String>)[1],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: calculateAnswerTextColor(1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        width: 200,
                        height: 200,
                        child: Card(
                          color: calculateCardColor(2),
                          child: InkWell(
                            onTap: () {
                              onAnswerClicked(2);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 6,
                                  (questions[currentQuestion]["options"]
                                      as List<String>)[2],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: calculateAnswerTextColor(2),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Card(
                          color: calculateCardColor(3),
                          child: InkWell(
                            onTap: () {
                              onAnswerClicked(3);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 6,
                                  (questions[currentQuestion]["options"]
                                      as List<String>)[3],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: calculateAnswerTextColor(3),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
