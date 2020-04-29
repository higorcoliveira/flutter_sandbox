import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function restart;

  Result(this.resultScore, this.restart);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 10) {
      resultText = 'Você é show!';
    } else if (resultScore > 10 && resultScore <= 15) {
      resultText = 'Você é ok!';
    } else if (resultScore > 15) {
      resultText = 'Você é um degenerado!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart'),
            onPressed: restart,
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
