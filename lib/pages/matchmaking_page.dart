import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quiz_app_front/main.dart';
import 'accept_player_page.dart';

class MatchmakingPage extends StatefulWidget {
  const MatchmakingPage({super.key});

  @override
  State<MatchmakingPage> createState() => MatchmakingPageState();
}

class MatchmakingPageState extends State<MatchmakingPage> with RouteAware {
  Timer? timer;

  Timer _setTimer() => Timer(const Duration(seconds: 3), () {
    navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (_) => const PlaySessionPage()),
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
              margin: EdgeInsets.only(top: 200, bottom: 200),
              child: Text(
                "Recherche de partie...",
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
