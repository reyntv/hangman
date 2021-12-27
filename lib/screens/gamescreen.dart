import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hangman/backend/game.dart';
import 'package:hangman/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'screens.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Game game = Provider.of<Game>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('HANGMAN'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ));
              }),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Word difficulty: ${game.settings.hardWords ? 'Hard' : 'Normal'}',
            ),
            HangingProgressDrawing(),
            WordProgress(),
            IncorrectGuesses(),
            game.hasLost() || game.hasWon()
                ? TextButton(onPressed: game.reset, child: Text('Play again'))
                : CharacterMap(),
          ],
        ),
      ),
    );
  }
}
