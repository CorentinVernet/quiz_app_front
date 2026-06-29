import 'package:flutter/material.dart';
import 'package:quiz_app_front/pages/between_rounds_page/widgets/status_label.dart';

class BetweenRoundsPage extends StatefulWidget {
  const BetweenRoundsPage({super.key});

  @override
  State<StatefulWidget> createState() => BetweenRoundsPageState();
}

class BetweenRoundsPageState extends State<BetweenRoundsPage> with RouteAware {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(child: Column(children: [StatusLabel()])),
  );
}
