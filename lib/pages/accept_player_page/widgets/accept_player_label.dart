import 'package:flutter/material.dart';
import 'package:quiz_app_front/widgets/fade_text.dart';

class AcceptPlayerLabel extends StatelessWidget {
  final String opponentName;

  const AcceptPlayerLabel({super.key, required this.opponentName});

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(top: 40, left: 30, right: 30),
    child: Card(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 70, bottom: 70),
          child: FadeTextWidget(text: opponentName, fontSize: 50),
        ),
      ),
    ),
  );
}
