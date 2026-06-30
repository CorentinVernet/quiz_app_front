import 'package:flutter/material.dart';
import 'package:quiz_app_front/i18n/generated/strings.g.dart';
import 'package:quiz_app_front/pages/history/widget/history_cards.dart';
import 'package:quiz_app_front/pages/history/widget/history_label.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final historyItems = <Map<String, Object>>[
    {"name": t.shared.theme_names.biology, "color": Colors.green},
    {"name": t.shared.theme_names.history, "color": Colors.brown},
    {"name": t.shared.theme_names.geography, "color": Colors.blue},
    {"name": t.shared.theme_names.mathematics, "color": Colors.red},
    {"name": t.shared.theme_names.literature, "color": Colors.purple},
    {"name": t.shared.theme_names.entertainment, "color": Colors.orange},
    {"name": t.shared.theme_names.physics_chemistry, "color": Colors.teal},
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HistoryLabel(),

            ...historyItems.map(
              (historyCard) => HistoryCard(
                cardsColor: historyCard["color"] as Color,
                theme: historyCard["name"] as String,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
