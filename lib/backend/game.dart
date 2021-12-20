import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hangman/backend/alphabet.dart';
import 'inputhandler.dart';
import 'wordhandler.dart';
import 'wordbank.dart';
import 'words/normal.dart';
import 'words/hard.dart';

//const String hardWords = 'words/hard.txt';
//const String normalWords = 'words/normal.txt';


//TODO: remove print calls
class Game extends ChangeNotifier {
  int incorrectGuesses = 0;
  int numberOfAllowedGuesses;
  String difficultyAnswer = '';
  Wordhandler wordhandler;
  String currentWord;
  Inputhandler inputhandler = Inputhandler();
  Wordbank wordbank;

  Game() {
    initializeGame();
    //start();
  }

  void initializeGame() {
    //TODO: Get difficulty through flutter UI
    /*print('Play with hard words? y/n?');
    difficultyAnswer = stdin.readLineSync();

    wordbank =
        difficultyAnswer == 'y' ? Wordbank(hardWords) : Wordbank(normalWords);

    print('Number of allowed guesses: ');
    numberOfAllowedGuesses = int.parse(stdin.readLineSync());*/

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
    /*print('Word length: ${wordhandler.currentWord.length}');
    String guess = inputhandler.getGuess();*/

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
      /*print('Restart game? y/n? ');
      String restartAnswer = stdin.readLineSync();
      if (restartAnswer == 'y') {
        reset();
      }*/
    }
    notifyListeners();
  }

  void reset() {
    if (wordbank.words.isEmpty) {
      print('''You finished all the words in this difficulty!
          Wordbank will be reset.''');

      /*wordbank =
          difficultyAnswer == 'y' ? Wordbank(hardWords) : Wordbank(normalWords);*/

      //temp hardcoded inputs
      wordbank = Wordbank(hardWords);
    }
    incorrectGuesses = 0;
    wordhandler.reset();
    currentWord = wordbank.getWord();
    wordhandler = Wordhandler(currentWord);
    print(currentWord);
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
