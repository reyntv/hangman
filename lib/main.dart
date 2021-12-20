import 'package:flutter/material.dart';
import 'package:hangman/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'backend/game.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Game(),
      child: Hangman(),
    ),
  );
}

//TODO: the whole flutter UI thing!

class Hangman extends StatefulWidget {
  @override
  State<Hangman> createState() => _HangmanState();
}

class _HangmanState extends State<Hangman> {
  @override
  Widget build(BuildContext context) {
    Game game = Provider.of<Game>(context);
    game.initializeGame();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('HANGMAN'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: CharacterMap()
            ),
          ],
        ),
      ),
    );
  }
}
