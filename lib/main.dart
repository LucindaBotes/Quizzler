import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'brain.dart';

Brain brain = Brain();
int right = 0;
int wrong = 10 - right;

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
              backgroundColor: Colors.grey.shade900,
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: QuizPage(),
                ),
              ),
            )
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> score = [];

  void check(bool pAnswer) {
    bool qAnswer = brain.getQuestionAnswer();
    setState(() {
      if (brain.gameOver() == true) {
        Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.")
            .show();

        //Modified for our purposes:
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'Your score was $right.',
        ).show();
        brain.reset();
        score = [];
      } else {
        if (pAnswer == qAnswer) {
          right++;
          score.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          score.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
      }

      brain.nextQ();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                brain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                check(true);
                setState(() {
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                check(false);
              },
            ),
          ),
        ),
        Row(
          children: score,
        )
      ],
    );
  }
}
