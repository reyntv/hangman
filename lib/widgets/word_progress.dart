import 'package:flutter/material.dart';
import 'package:hangman/backend/game.dart';
import 'package:provider/provider.dart';

class WordProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Game game = Provider.of<Game>(context);
    return Text(
      game.wordhandler.display().toUpperCase(),
      style: TextStyle(
        fontSize: 30.0,
      ),
    );
  }
}
