import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_app_front/main.dart';
import "../../i18n/generated/strings.g.dart";
import 'package:quiz_app_front/pages/game_page/game_page.dart';
import 'package:quiz_app_front/pages/waiting_for_theme_page/widgets/waiting_icon.dart';
import 'package:quiz_app_front/pages/waiting_for_theme_page/widgets/waiting_for_theme_label.dart';

class WaitingForThemePage extends StatefulWidget {
  const WaitingForThemePage({super.key});

  @override
  State<StatefulWidget> createState() => WaitingForThemePageState();
}

class WaitingForThemePageState extends State<WaitingForThemePage>
    with RouteAware {
  Timer? timer;

  Timer _setTimer() => Timer(const Duration(seconds: 3), () {
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (_) =>
            GamePage(roundName: t.shared.round_names.first_round_name),
      ),
    );
  });

  @override
  void initState() {
    super.initState();
    timer = _setTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    routeObserver.unsubscribe(this);
  }

  @override
  void didPopNext() {
    timer = _setTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [WaitingForThemeLabel(), WaitingIcon()]),
      ),
    );
  }
}
