import 'package:flutter/material.dart';

class NextRoundButton extends StatelessWidget {
  final String buttonLabel;
  final void Function() onNextRoundButtonPressed;

  const NextRoundButton({
    super.key,
    required this.buttonLabel,
    required this.onNextRoundButtonPressed,
  });

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
    child: SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onNextRoundButtonPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 137, 187, 116),
          foregroundColor: Colors.white,
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.only(top: 15, bottom: 15),
        ),
        child: Text(buttonLabel),
      ),
    ),
  );
}
