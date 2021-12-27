import 'package:flutter/material.dart';
import 'inputhandler.dart';
import 'wordhandler.dart';
import 'wordbank.dart';
import 'words/normal.dart';
import 'words/hard.dart';
import 'settings.dart';

class Game with ChangeNotifier {
  int incorrectGuesses = 0;
  int numberOfAllowedGuesses;
  String currentWord;
  Wordhandler wordhandler;
  Wordbank wordbank;
  Inputhandler inputhandler = Inputhandler();
  Settings settings = Settings();

  Game() {
    initializeGame();
  }

  void initializeGame() {
    wordbank = Wordbank(normalWords);
    numberOfAllowedGuesses = 11;

    currentWord = wordbank.getWord();
    wordhandler = Wordhandler(currentWord);
  }

  playRound(String guess) {
    if (inputhandler.availableCharacters.contains(guess)) {
      if (wordhandler.checkChar(guess)) {
        wordhandler.addChar(guess);
      } else {
        handleWrongGuess(guess);
      }

      inputhandler.availableCharacters.remove(guess);
      notifyListeners();
    }
  }

  void reset() {
    //TODO: Handle finished wordbank in flutter UI
    if (wordbank.words.isEmpty) {
      print('''You finished all the words in this difficulty!
          Wordbank will be reset.''');

      wordbank = Wordbank(normalWords);
    }
    incorrectGuesses = 0;
    wordhandler.reset();
    inputhandler.reset();
    currentWord = wordbank.getWord();
    wordhandler = Wordhandler(currentWord);
    notifyListeners();
  }

  void settingsChanged() {
    wordbank = settings.hardWords ? Wordbank(hardWords) : Wordbank(normalWords);
    reset();
  }

  void handleWrongGuess(String guess) {
    if (!inputhandler.wronglyGuessedCharacters.contains(guess)) {
      inputhandler.wrongGuess(guess);
      incorrectGuesses++;
    }
  }

  bool hasWon() {
    return wordhandler.checkMatch();
  }

  bool hasLost() {
    return incorrectGuesses >= numberOfAllowedGuesses;
  }
}
