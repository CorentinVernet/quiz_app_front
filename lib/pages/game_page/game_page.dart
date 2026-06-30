//import 'dart:async';

import 'package:flutter/material.dart' hide Theme;
import 'package:quiz_app_front/pages/game_page/models/question.dart';
import 'package:quiz_app_front/pages/game_page/assets/questions.dart';
import 'package:quiz_app_front/pages/game_page/widgets/question_label.dart';
import 'package:quiz_app_front/pages/game_page/widgets/round_name_label.dart';
import 'package:quiz_app_front/pages/game_page/widgets/answer_suggestion.dart';
import 'package:quiz_app_front/pages/between_rounds_page/between_rounds_page.dart';
import 'package:quiz_app_front/pages/matchmaking_page/models/player.dart';

import '../../shared_models/theme.dart';

class GamePage extends StatefulWidget {
  final Theme theme;
  final String roundName;
  final Player opponent;

  const GamePage({
    super.key,
    required this.roundName,
    required this.theme,
    required this.opponent,
  });

  @override
  State<StatefulWidget> createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  int redAnswerIndex = -1;
  int greenAnswerIndex = -1;
  int currentQuestionIndex = 0;
  late Question currentQuestion;

  @override
  void initState() {
    super.initState();
    // TODO implement a service which fetches random questions from the whole set. The `questions` list below should not be imported but randomly extracted.
    currentQuestion = questions[0];
  }

  void _onSuggestionPressed(int cardIndex) {
    int correctAnswerIndex = currentQuestion.getCorrectAnswerIndex();
    if (correctAnswerIndex == cardIndex) {
      setState(() => greenAnswerIndex = cardIndex);
    } else {
      setState(() {
        redAnswerIndex = cardIndex;
        greenAnswerIndex = correctAnswerIndex;
      });
    }

    // When the user presses a suggestion, then display the results (correct answer or not).
    // In order to have enough time to process these results, then wait for one second before switching to the next question.
    // If this question was the last one, then redirect to the "between rounds" page to allow the opponents to display the results of the whole round.
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        redAnswerIndex = -1;
        greenAnswerIndex = -1;
        if (currentQuestionIndex < 4) {
          currentQuestionIndex++;
          currentQuestion = questions[currentQuestionIndex];
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  BetweenRoundsPage(opponent: widget.opponent),
            ),
          );
        }
      });
    });
  }

  Color _calculateSuggestionBgColor(int cardIndex) =>
      greenAnswerIndex == cardIndex
      ? Colors.green
      : redAnswerIndex == cardIndex
      ? Colors.red
      : Colors.white70;

  Color _calculateSuggestionTextColor(int cardIndex) {
    Color cardColor = _calculateSuggestionBgColor(cardIndex);
    return cardColor != Colors.white70 ? Colors.white : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            RoundNameLabel(roundName: widget.roundName),
            QuestionLabel(currentQuestion: currentQuestion),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnswerSuggestion(
                        suggestionIndex: 0,
                        suggestionLabel: currentQuestion.getOptions()[0],
                        onSuggestionPressed: _onSuggestionPressed,
                        calculateSuggestionBgColor: _calculateSuggestionBgColor,
                        calculateSuggestionTextColor:
                            _calculateSuggestionTextColor,
                      ),
                      AnswerSuggestion(
                        suggestionIndex: 1,
                        suggestionLabel: currentQuestion.getOptions()[1],
                        onSuggestionPressed: _onSuggestionPressed,
                        calculateSuggestionBgColor: _calculateSuggestionBgColor,
                        calculateSuggestionTextColor:
                            _calculateSuggestionTextColor,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnswerSuggestion(
                        suggestionIndex: 2,
                        suggestionLabel: currentQuestion.getOptions()[2],
                        onSuggestionPressed: _onSuggestionPressed,
                        calculateSuggestionBgColor: _calculateSuggestionBgColor,
                        calculateSuggestionTextColor:
                            _calculateSuggestionTextColor,
                      ),
                      AnswerSuggestion(
                        suggestionIndex: 3,
                        suggestionLabel: currentQuestion.getOptions()[3],
                        onSuggestionPressed: _onSuggestionPressed,
                        calculateSuggestionBgColor: _calculateSuggestionBgColor,
                        calculateSuggestionTextColor:
                            _calculateSuggestionTextColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
