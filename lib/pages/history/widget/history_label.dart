import 'package:flutter/material.dart';
import "../../../i18n/generated/strings.g.dart";

class HistoryLabel extends StatelessWidget {
  const HistoryLabel({super.key});

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(top: 20, bottom: 50),
    child: Text(
      t.history_page.history_label,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );
}
