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
    return wronglyGuessedCharacters.join(' ').toUpperCase();
  }

  void reset() {
    initInput();
  }
}
