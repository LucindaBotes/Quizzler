import 'question.dart';

class Brain {
  int _qNum = 0;

  int get qNum => _qNum;
  List<Question> _qBank = [
    Question(
      q: 'The Salem Witch Trials caused by hallucinogenic fungus infecting the people of Salem',
      a: false,
    ),
    Question(
      q: 'The sinking of the RMS Titanic occurred on the night of 14 April 1918',
      a: false,
    ),
    Question(
      q: 'Napoleon suffered defeat at Waterloo in 1815',
      a: true,
    ),
    Question(
      q: 'The West coast of Australia was originally called New Holland',
      a: true,
    ),
    Question(
      q: 'Cleopatra was assassinated on the Ides of March',
      a: false,
    ),
    Question(
      q: 'Dentures used to be made with human teeth',
      a: true,
    ),
    Question(
      q: 'The Pilgrims left England seeking religious freedom',
      a: false,
    ),
    Question(
      q: 'Doctors used to not give women painkillers during birth',
      a: true,
    ),
    Question(
      q: 'Julius Caesar was the first baby to be delivered via C-section',
      a: false,
    ),
    Question(
      q: 'The Battle of Agincourt took place during the Hundred Years\' War',
      a: true,
    ),
  ];

  bool gameOver() {
    return _qNum == 9 ? true : false;
  }

  void reset() {
    if (gameOver() == true) {
      _qNum = 0 - 1;
    }
  }

  String getQuestionText() {
    return _qBank[_qNum].questionText;
  }

  void nextQ() {
    if (_qNum < (_qBank.length - 1)) {
      _qNum++;
    }
  }

  bool getQuestionAnswer() {
    return _qBank[_qNum].questionAnswer;
  }
}
