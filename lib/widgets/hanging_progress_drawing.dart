import 'package:flutter/material.dart';
import 'package:hangman/backend/game.dart';
import 'package:provider/provider.dart';

class HangingProgressDrawing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Game game = Provider.of<Game>(context);
    return Container(
      padding: EdgeInsets.only(top: 50.0, bottom: 50.0),
      child: Image.asset('images/hangman${game.incorrectGuesses}.png',
          gaplessPlayback: true),
    );
  }
}
