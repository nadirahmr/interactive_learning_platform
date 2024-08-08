import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interactive Learning Platform',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  final List<Map<String, Object>> _questions = [
    {
      'question': 'What is the capital of Malaysia?',
      'answers': ['Paris', 'Kuala Lumpr', 'New Delhi', 'Ottawa'],
      'correctAnswer': 'Kuala Lumpur',
    },
    {
      'question': 'What is 20 + 20 / 10?',
      'answers': ['24', '22', '4', '40'],
      'correctAnswer': '22',
    },
  ];

  void _answerQuestion(String answer) {
    if (answer == _questions[_currentQuestionIndex]['correctAnswer']) {
      setState(() {
        _score++;
      });
    }
    setState(() {
      _currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interactive Quiz'),
      ),
      body: _currentQuestionIndex < _questions.length
          ? Column(
              children: <Widget>[
                Text(
                  _questions[_currentQuestionIndex]['question'] as String,
                  style: TextStyle(fontSize: 24),
                ),
                ...(_questions[_currentQuestionIndex]['answers'] as List<String>)
                    .map((answer) {
                  return ElevatedButton(
                    onPressed: () => _answerQuestion(answer),
                    child: Text(answer),
                  );
                }).toList(),
              ],
            )
          : Center(
              child: Text(
                'Quiz Complete!\nYour score: $_score/${_questions.length}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
            ),
    );
  }
}
