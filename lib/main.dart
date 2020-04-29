import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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

  void _answerQuestion() {
    // força esse widget a ser renderizado
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    // estrutura de mapa
    const questions = const [
      {
        'questionText': 'Qual sua cor favorita?',
        'answers': ['Preto', 'Azul', 'Verde', 'Branco']
      },
      {
        'questionText': 'Qual seu animal favorito?',
        'answers': ['Gato', 'Cachorro', 'Peixe', 'Boi']
      },
      {
        'questionText': 'Qual seu time?',
        'answers': ['Botafogo', 'Botafogo', 'Botafogo', 'Botafogo']
      }
    ];

    // home é um namedArgument, um recurso do Dart
    // Scaffold cria uma página/estrutura básica para o app
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Questionário')),
        body: Column(children: [
          Question(questions[_questionIndex]['questionText']),
          ...(questions[_questionIndex]['answers'] as List<String>)
              .map((answer) {
            return Answer(_answerQuestion, answer);
          }).toList()
        ]),
      ),
    );
  }
}
