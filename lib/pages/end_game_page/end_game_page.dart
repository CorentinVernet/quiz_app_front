import 'package:flutter/material.dart';

class EndGamePage extends StatefulWidget {
  final List<String> winners;

  const EndGamePage({super.key, required this.winners});

  @override
  State<StatefulWidget> createState() => EndGamePageState();
}

class EndGamePageState extends State<EndGamePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Container(
        margin: null,
        child: switch (widget.winners.join(",")) {
          "" => Text(
            "Les deux joueurs ont perdu !",
            style: TextStyle(fontSize: 50),
          ),
          "me,opponent" => Text(
            "Les deux joueurs ont gagné !",
            style: TextStyle(fontSize: 50),
          ),
          "opponent" => Text(
            "Vous avez perdu !",
            style: TextStyle(fontSize: 50),
          ),
          "me" => Text("Vous avez gagné !", style: TextStyle(fontSize: 50)),
          _ => Text("Erreur", style: TextStyle(fontSize: 50)),
        },
      ),
    ),
  );
}
