import 'package:flutter/material.dart';
import 'package:projeto_perguntas/widgets/questions.dart';
import 'package:projeto_perguntas/widgets/result.dart';

void main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _selectedQuestion = 0, _totalValue = 0;

  final List<Map<String, Object>> _questions = const [
    {
      'question': 'What is your favorite color?',
      'answers': [
        {'text': 'Black', 'value': 1},
        {'text': 'Red', 'value': 2},
        {'text': 'Green', 'value': 3},
        {'text': 'White', 'value': 4},
        {'text': 'Other color', 'value': 5}
      ]
    },
    {
      'question': 'What is your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'value': 1},
        {'text': 'Snake', 'value': 2},
        {'text': 'Elephant', 'value': 3},
        {'text': 'Lion', 'value': 4},
        {'text': 'Other animal', 'value': 5}
      ]
    },
    {
      'question': 'What is your favorite instructor?',
      'answers': [
        {'text': 'Felipe', 'value': 1},
        {'text': 'João', 'value': 2},
        {'text': 'Rafael', 'value': 3},
        {'text': 'Maria', 'value': 4},
        {'text': 'Other instructor', 'value': 5}
      ]
    }
  ];

  void _respond(int value) {
    if (_haveQuestionSelected) {
      this.setState(() {
        _selectedQuestion++;
        _totalValue += value;
      });
    }
  }

  void _restartQuiz() {
    this.setState(() {
      _selectedQuestion = 0;
      _totalValue = 0;
    });
  }

  bool get _haveQuestionSelected {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Questions')),
        body: _haveQuestionSelected
          ? Questions(
            selectedQuestion: _selectedQuestion,
            questions: _questions,
            respond: _respond)
          : Result(
            totalValue: _totalValue,
            restartQuiz: _restartQuiz,
          )
      )
    );
  }
}
