import 'package:flutter/material.dart';
import "../../../i18n/generated/strings.g.dart";

class WaitingForThemeLabel extends StatelessWidget {
  const WaitingForThemeLabel({super.key});

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(top: 200, bottom: 150),
    child: Text(
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 40),
      t.waiting_for_theme_page.waiting_for_theme_label,
    ),
  );
}
