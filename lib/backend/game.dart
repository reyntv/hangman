import 'package:flutter/material.dart';
import 'inputhandler.dart';
import 'wordhandler.dart';
import 'wordbank.dart';
import 'words/normal.dart';
import 'words/hard.dart';

//TODO: remove print calls
class Game with ChangeNotifier {
  int incorrectGuesses = 0;
  int numberOfAllowedGuesses;
  String difficultyAnswer = '';
  String currentWord;
  Wordhandler wordhandler;
  Inputhandler inputhandler = Inputhandler();
  Wordbank wordbank;

  Game() {
    initializeGame();
    //start();
  }

  void initializeGame() {
    //TODO: Get difficulty through flutter UI

    //temp hardcoded inputs
    wordbank = Wordbank(hardWords);
    print(wordbank.words);
    numberOfAllowedGuesses = 7;

    currentWord = wordbank.getWord();
    wordhandler = Wordhandler(currentWord);
    print(currentWord);
  }

  /*void start() {
    while (!hasWon() && !hasLost()) {
      playRound();
    }
  }*/

  playRound(String guess) {
    if (inputhandler.availableCharacters.contains(guess)) {
      if (wordhandler.checkChar(guess)) {
        print('correct');
        wordhandler.addChar(guess);
      } else {
        handleWrongGuess(guess);
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
        reset();
      }

      inputhandler.availableCharacters.remove(guess);
      notifyListeners();
    }
  }

  void reset() {
    if (wordbank.words.isEmpty) {
      print('''You finished all the words in this difficulty!
          Wordbank will be reset.''');

      //temp hardcoded inputs
      wordbank = Wordbank(hardWords);
    }
    incorrectGuesses = 0;
    wordhandler.reset();
    inputhandler.reset();
    currentWord = wordbank.getWord();
    wordhandler = Wordhandler(currentWord);
    print(currentWord);
    notifyListeners();
  }

  void handleWrongGuess(String guess) {
    if (!inputhandler.wronglyGuessedCharacters.contains(guess)) {
      inputhandler.wrongGuess(guess);
      incorrectGuesses++;
      print('wrong $incorrectGuesses');
    }
    print(inputhandler.wronglyGuessedCharacters);
  }

  bool hasWon() {
    return wordhandler.checkMatch();
  }

  bool hasLost() {
    return incorrectGuesses >= numberOfAllowedGuesses;
  }
}
