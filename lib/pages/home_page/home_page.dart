// Title already exists in the Flutter framework.
// Since this page does not use this one, then hide it to avoid a collision with our custom Title widget.
import 'package:flutter/material.dart' hide Title;
import 'package:quiz_app_front/pages/home_page/widgets/app_bar.dart';
import 'package:quiz_app_front/pages/home_page/widgets/title.dart';
import 'package:quiz_app_front/pages/home_page/widgets/run_game_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(),

    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Title(), RunGameButton()],
      ),
    ),
  );
}
