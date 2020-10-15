import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './result.dart';
import './quiz.dart';
import './answer.dart';
import './question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('we have more questions !');
    } else {
      print('There is no more questions :D !');
    }
  }

  final _questions = const [
    {
      'questionText': "what's your favourite Hobby ?",
      'answers': [
        {'text': 'Drawing', 'score': 0},
        {'text': 'Reading', 'score': 10},
        {'text': 'Travelling abroad', 'score': 0},
        {'text': 'cooking', 'score': 0},
      ],
    },
    {
      'questionText': "what's your favourite movie ?",
      'answers': [
        {'text': 'Titanic', 'score': 0},
        {'text': 'Me Before You', 'score': 0},
        {'text': 'The Fault in Our Stars', 'score': 0},
        {'text': 'Five Feet Apart', 'score': 10},
      ],
    },
    {
      'questionText': "what's your soft skill ?",
      'answers': [
        {'text': 'Creative Thinking', 'score': 10},
        {'text': 'Teamwork', 'score': 0},
        {'text': 'Time Management', 'score': 0},
        {'text': 'Responsibility', 'score': 0},
      ],
    },
    {
      'questionText': "what's your favourite color ?",
      'answers': [
        {'text': 'Green', 'score': 0},
        {'text': 'Black', 'score': 0},
        {'text': 'white', 'score': 10},
        {'text': 'Red', 'score': 0},
      ],
    },
    {
      'questionText': "what's your favourite singer?",
      'answers': [
        {'text': 'Dua Lipa', 'score': 0},
        {'text': 'Taylor Swift', 'score': 0},
        {'text': 'Adele', 'score': 10},
        {'text': 'Christina Perri', 'score': 0},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Character Description Test :D'),
          backgroundColor: Colors.grey,
          shadowColor: Colors.white,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
