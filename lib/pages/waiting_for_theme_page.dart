import 'dart:async';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quiz_app_front/main.dart';
import 'package:quiz_app_front/pages/game_page.dart';

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
      MaterialPageRoute(builder: (_) => GamePage(roundName: "Première Manche")),
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
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 200, bottom: 150),
              child: Text(
                "L'adversaire choisi un thème...",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40),
              ),
            ),
            Container(
              child: LoadingAnimationWidget.waveDots(
                color: Colors.black,
                size: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
