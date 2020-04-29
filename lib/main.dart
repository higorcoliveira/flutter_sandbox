import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

// todo Widget deve estender uma das classes StatelessWidget ou StatefulWidget
// StatelessWidget não pode ter mudança de estado interna, somente externa
// StatefulWidget pode ter mudança de estado interna e externa

// É recriado toda vez que o dado interno é alterado
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// Não é recriado
// _ transforma a classe em privada
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  // estrutura de mapa
  final _questions = const [
    {
      'questionText': 'Qual sua cor favorita?',
      'answers': [
        {'text': 'Vermelho', 'score': 10},
        {'text': 'Preto', 'score': 5},
        {'text': 'Verde', 'score': 3},
        {'text': 'Branco', 'score': 1}
      ]
    },
    {
      'questionText': 'Qual seu animal favorito?',
      'answers': [
        {'text': 'Cobra', 'score': 10},
        {'text': 'Aranha', 'score': 5},
        {'text': 'Cachorro', 'score': 3},
        {'text': 'Peixe', 'score': 1}
      ]
    },
    {
      'questionText': 'Qual seu time?',
      'answers': [
        {'text': 'Flamengo', 'score': 10},
        {'text': 'Corinthians', 'score': 5},
        {'text': 'Santos', 'score': 3},
        {'text': 'Botafogo', 'score': 1}
      ]
    }
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    // força esse widget a ser renderizado
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _restart() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // home é um namedArgument, um recurso do Dart
    // Scaffold cria uma página/estrutura básica para o app
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Questionário do degenerado')),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, _restart),
      ),
    );
  }
}
