import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answer;
  final void Function() onPressed;

  Answer(
    this.answer,
    this.onPressed,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(answer),
        onPressed: onPressed,
      ),
    );
  }
}
