import 'package:flutter/material.dart';
import 'package:hangman/backend/game.dart';
import 'package:provider/provider.dart';

class IncorrectGuesses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Game game = Provider.of<Game>(context);
    return Text(game.inputhandler.wronglyGuessedCharacters.isEmpty
        ? ''
        : 'Incorrect guesses: ${game.inputhandler.displayWrongGuesses()}');
  }
}
