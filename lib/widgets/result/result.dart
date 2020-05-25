import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() reset;

  Result(this.score, this.reset);

  String get getResult {
    if (score < 8) return 'Parabéns!';
    if (score < 12) return 'Você é bom!';
    if (score < 16) return 'Impressionante!';
    return 'Nível Jedi!';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            getResult,
            style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(
          child: Text(
            'Reiniciar',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.blue,
          onPressed: reset,
        ),
      ],
    );
  }
}
