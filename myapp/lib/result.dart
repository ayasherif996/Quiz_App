import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function restart;
  Result(this.resultScore, this.restart);

  String get resultPhase {
    var resultText = 'THE END ';
    if (resultScore <= 10) {
      resultText = ' you are lazy .Try to be more active';
    } else if (resultScore <= 20) {
      resultText = 'you are an optimistic person ';
    } else if (resultScore <= 30) {
      resultText = 'you are ambitious';
    } else if (resultScore <= 50) {
      resultText = 'you are a sensitive person';
    } else {
      resultText = 'You are loved 🥰';
    }
    return resultText;
  }

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhase,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz!',
            ),
            textColor: Colors.blue,
            onPressed: restart,
          ),
        ],
      ),
    );
  }
}
