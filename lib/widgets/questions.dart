import 'package:flutter/material.dart';
import 'package:projeto_perguntas/widgets/question.dart';

import 'button_answer.dart';

class Questions extends StatelessWidget {
  final int selectedQuestion;
  final List<Map<String, Object>> questions;
  final void Function(int) respond;

  Questions({@required this.selectedQuestion, @required this.questions, @required this.respond});

  bool get _haveQuestionSelected {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> _responds = _haveQuestionSelected
      ? questions[selectedQuestion]['answers']
      : null;

    List<Widget> _respondsWidgets = _haveQuestionSelected 
      ? _responds
        .map((resp) => ButtonAnswer(resp['text'], () => respond(resp['value'])))
        .toList()
      : null;
      
    return Column(
      children: [
        Question(questions[selectedQuestion]['question']),
        ..._respondsWidgets
      ],
    );
  }
}