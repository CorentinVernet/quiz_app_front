import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_app_front/main.dart';
import '../accept_player_page/accept_player_page.dart';
import 'package:quiz_app_front/pages/matchmaking_page/widgets/search_label.dart';
import 'package:quiz_app_front/pages/matchmaking_page/widgets/loading_animation.dart';

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
    // This enables the route observer to listen for route changes, allowing the user to restart the timer when returning to this page.
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
    // If the user navigates back to this page, then restart the timer to ensure the transition to the next page occurs after 3 seconds.
    timer = _setTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            MatchmakingPageSearchLabel(),
            MatchmakingPageLoadingAnimation(),
          ],
        ),
      ),
    );
  }
}
