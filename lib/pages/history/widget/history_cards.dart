import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final Color cardsColor;
  final String theme;

  void _onThemePressed(BuildContext context) => {};

  const HistoryCard({super.key, required this.cardsColor, required this.theme});

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.all(6),
    child: Card(
      color: cardsColor,
      child: InkWell(
        child: ListTile(title: Text(theme)),
        onTap: () => _onThemePressed(context),
      ),
    ),
  );
}
