import 'package:flutter/material.dart';
import './widgets/quiz/quiz.dart';
import './widgets/result/result.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _selectedQuestion = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'question': 'Qual é a sua cor favorita?',
      'answers': [
        {'answer': 'Preto', 'score': 10},
        {'answer': 'Vermelho', 'score': 5},
        {'answer': 'Verde', 'score': 3},
        {'answer': 'Branco', 'score': 1},
      ]
    },
    {
      'question': 'Qual é o seu animal favorito?',
      'answers': [
        {'answer': 'Coelho', 'score': 10},
        {'answer': 'Cobra', 'score': 5},
        {'answer': 'Elefante', 'score': 3},
        {'answer': 'Leão', 'score': 1},
      ]
    },
    {
      'question': 'Qual é o seu instrutor favorito?',
      'answers': [
        {'answer': 'Maria', 'score': 10},
        {'answer': 'João', 'score': 5},
        {'answer': 'Leo', 'score': 3},
        {'answer': 'Pedro', 'score': 1}, 
      ]
    }
  ];

  void _answer(int score) {
    if (hasQuestion) {
      setState(() {
        _selectedQuestion++;
        _totalScore += score;
      });
    }
  }

  void _reset() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  bool get hasQuestion {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          centerTitle: true,
        ),
        body: hasQuestion
            ? Quiz(
                selectedQuestion: _selectedQuestion,
                questions: _questions,
                answer: _answer,
              )
            : Result(_totalScore, _reset),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
