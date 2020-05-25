import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final int selectedQuestion;
  final List<Map<String, Object>> questions;
  final void Function(int) answer;

  const Quiz({
    @required this.selectedQuestion,
    @required this.questions,
    @required this.answer,
  });

  bool get hasQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = hasQuestion
        ? questions[selectedQuestion]['answers']
        : null;
    return Column(
      children: <Widget>[
        Question(questions[selectedQuestion]['question']),
        ...answers.map((ans) {
          return Answer(
            ans['answer'],
            () => answer(ans['score']),
          );
        }).toList()
      ],
    );
  }
}
