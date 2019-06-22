import 'package:flutter/material.dart';
import 'package:quiz_app/ui/question_text.dart';
import 'package:quiz_app/utils/questions.dart';
import 'package:quiz_app/utils/quiz.dart';
import '../ui/answer_button.dart';
import '../ui/corrects_wrong_overlay.dart';
import '../pages/score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuizPageState();
  }
}

class QuizPageState extends State<QuizPage> {
  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question('Elon Musk is human', false),
    new Question('Is Pizza healthy', false),
    new Question('Flutter is Awesome', true),
    new Question('Programming is easy', true),
    new Question('Java programmers can\'t see sharp ', false),
    new Question('Java is to car as Javascript is to carpet', true)
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;

  bool overlayVisibility = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayVisibility = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          // quiz page main
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false)),
          ],
        ),
        overlayVisibility == true
            ? new CorrectWrongOverlay(isCorrect, () {
                if (quiz.length == questionNumber) {
                  Navigator.of(context).pushAndRemoveUntil(
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new ScorePage(quiz.score, quiz.length)),
                      (Route route) => route == null);
                  return;
                }
                currentQuestion = quiz.nextQuestion;
                this.setState(() {
                  overlayVisibility = false;
                  questionText = currentQuestion.question;
                  questionNumber = quiz.questionNumber;
                });
              })
            : new Container(),
      ],
    );
  }
}
