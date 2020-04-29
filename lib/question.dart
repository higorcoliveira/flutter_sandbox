import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText; // similar aos props do React

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    // widget invisivel
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
