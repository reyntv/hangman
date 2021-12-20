import 'package:flutter/material.dart';
import 'package:hangman/backend/game.dart';
import 'package:hangman/widgets/widgets.dart';
import 'package:provider/provider.dart';

//TODO: Show incorrect guesses.
//TODO: Difficulty selection in UI.
//TODO: Play again widget.

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Game game = Provider.of<Game>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('HANGMAN'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            HangingProgressDrawing(),
            Expanded(
              child: Text(
                game.wordhandler.display().toUpperCase(),
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
            Text(game.inputhandler.wronglyGuessedCharacters.isEmpty
                ? ''
                : 'Incorrect guesses: ${game.inputhandler.displayWrongGuesses()}'),
            Column(children: <Widget>[CharacterMap()]),
          ],
        ),
      ),
    );
  }
}
