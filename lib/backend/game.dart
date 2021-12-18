import 'dart:io';

import 'inputhandler.dart';
import 'wordhandler.dart';
import 'wordbank.dart';

//TODO: remove print calls
class Game {
  int incorrectGuesses = 0;
  int numberOfAllowedGuesses;
  String difficultyAnswer = '';
  Wordhandler wordhandler;
  String currentWord;
  Inputhandler inputhandler = Inputhandler();
  Wordbank wordbank;

  Game() {
    initializeGame();
    start();
  }

  void initializeGame() {
    //TODO: Get difficulty through flutter UI
    print('Play with hard words? y/n?');
    difficultyAnswer = stdin.readLineSync();

    if (difficultyAnswer == 'y') {
      wordbank = Wordbank('words/hard.txt');
      //currentWord = Wordbank('words/hard.txt').getWord();
    } else {
      wordbank = Wordbank('words/normal.txt');
      //currentWord = Wordbank('words/normal.txt').getWord();
    }

    print('Number of allowed guesses: ');
    numberOfAllowedGuesses = int.parse(stdin.readLineSync());

    currentWord = wordbank.getWord();
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

    //TODO: rework playing again when handled in flutter
    if (hasWon()) {
      print('You won!');
    }

    if (hasLost()) {
      print('You lost!');
    }

    if (hasWon() || hasLost()) {
      print('Restart game? y/n? ');
      String restartAnswer = stdin.readLineSync();
      if (restartAnswer == 'y') {
        reset();
      }
    }
  }

  void reset() {
    if (wordbank.words.isEmpty) {
      print('''You finished all the words in this difficulty!
          Wordbank will be reset.''');

      if (difficultyAnswer == 'y') {
        wordbank = Wordbank('words/hard.txt');
        //currentWord = Wordbank('words/hard.txt').getWord();
      } else {
        wordbank = Wordbank('words/normal.txt');
        //currentWord = Wordbank('words/normal.txt').getWord();
      }
    }
    incorrectGuesses = 0;
    wordhandler.reset();
    currentWord = wordbank.getWord();
    wordhandler = Wordhandler(currentWord);
    print(currentWord);
    print('wordbank: ${wordbank.words}');
  }

  void handleWrongGuess() {
    print('wrong $incorrectGuesses');
    incorrectGuesses++;
  }

  bool hasWon() {
    return wordhandler.checkMatch();
  }

  bool hasLost() {
    return incorrectGuesses >= numberOfAllowedGuesses;
  }
}
