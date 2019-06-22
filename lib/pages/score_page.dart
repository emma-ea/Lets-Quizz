import 'package:flutter/material.dart';
import '../pages/landing_page.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final int totalQuestion;

  ScorePage(this.score, this.totalQuestion);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Your Score',
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50.0,
                color: Colors.white),
          ),
          Text(
            score.toString() + '/' + totalQuestion.toString(),
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50.0,
                color: Colors.white),
          ),
          IconButton(
            icon: Icon(Icons.arrow_right),
            color: Colors.white,
            iconSize: 150.0,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => LandingPage()),
                (Route route) => route == null),
          ),
        ],
      ),
    );
  }
}
