import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalValue;
  final void Function() restartQuiz;

  Result({@required this.totalValue, this.restartQuiz});

  String get resultString {
    if(totalValue < 8) {
      return 'Good!';
    } else if(totalValue < 10) {
      return 'Very good!';
    } else if(totalValue < 12) {
      return 'Awesome!';
    } else {
      return 'Congratulations!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            resultString,
            style: TextStyle(fontSize: 28)
          ),
        ),
        FlatButton(
          child: Text(
            'Restart Quiz',
            style: TextStyle(
              color: Colors.white
            ),
          ),
          color: Colors.blueAccent,
          onPressed: restartQuiz,
        )
      ],
    );
  }
}