import 'dart:io';

import 'inputhandler.dart';
import 'wordhandler.dart';
import 'wordbank.dart';

//TODO: remove print calls
class Game {
  int incorrectGuesses = 0;
  Wordhandler wordhandler;
  String currentWord;
  Inputhandler inputhandler = Inputhandler();

  Game() {
    initializeGame();
    start();
  }

  void initializeGame() {
    //TODO: change wordbank according to difficulty?
    currentWord = Wordbank('words/hard.txt').getWord();
    wordhandler = Wordhandler(currentWord);
    print(currentWord);
  }

  void start() {
    while (!hasWon() && !hasLost()) {
      playRound();
    }
  }

  void playRound() {
    print('Word length: ${wordhandler.currentWord.length}');
    String guess = inputhandler.getGuess();

    if (wordhandler.checkChar(guess)) {
      print('correct');
      wordhandler.addChar(guess);
    } else {
      handleWrongGuess();
    }

    print(wordhandler.displayWord);

    //TODO: rework this when handled in flutter
    if (hasWon()) {
      print('You won!');
    }

    if (hasLost()) {
      print('You lost!');
    }

    if (hasWon() || hasLost()) {
      print('Restart game? y? ');
      String restartAnswer = stdin.readLineSync();
      if (restartAnswer == 'y') {
        reset();
      }
    }
  }

  void reset() {
    incorrectGuesses = 0;
    wordhandler.reset();
    initializeGame();
  }

  void handleWrongGuess() {
    print('wrong $incorrectGuesses');
    incorrectGuesses++;
  }

  bool hasWon() {
    return wordhandler.checkMatch();
  }

  bool hasLost() {
    //TODO: fix hardcoding of allowed incorrect guesses?
    return incorrectGuesses >= 7;
  }
}
