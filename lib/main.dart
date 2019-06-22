import 'package:flutter/material.dart';
import 'package:quiz_app/pages/landing_page.dart';
import 'package:quiz_app/pages/quiz_page.dart';
import 'package:quiz_app/pages/score_page.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'Test Quizz',
      home: LandingPage(),
    )
  );
}