import 'package:flutter/material.dart';

class ButtonAnswer extends StatelessWidget {
  final String _answer;
  final void Function() _respond;
  
  ButtonAnswer(this._answer, this._respond);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blueAccent,
        textColor: Colors.white,
        child: Text(_answer),
        onPressed: _respond,
      ),
    );
  }
}