import 'package:hangman/backend/alphabet.dart';

class Inputhandler {
  List<String> availableCharacters;
  List<String> wronglyGuessedCharacters;

  Inputhandler() {
    initInput();
  }

  void initInput() {
    wronglyGuessedCharacters = [];
    availableCharacters = alphabet.toList();
  }

  void wrongGuess(String character) {
    if (!wronglyGuessedCharacters.contains(character)) {
      wronglyGuessedCharacters.add(character);
    }
  }

  String displayWrongGuesses() {
    return wronglyGuessedCharacters.join(' ');
  }

  void reset() {
    initInput();
  }

  /*getGuess() {
    print('Enter character to guess: ');
    //TODO: change to get character from flutter UI, remove ability to enter same character more than once.
    return stdin.readLineSync();
  }*/
}
