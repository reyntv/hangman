import 'package:flutter/material.dart';
import 'package:hangman/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'backend/game.dart';
import 'package:flutter/widgets.dart';

//TODO: Go through Dart analysis and fix

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Game(),
      child: Hangman(),
    ),
  );
}

class Hangman extends StatefulWidget {
  @override
  State<Hangman> createState() => _HangmanState();
}

class _HangmanState extends State<Hangman> {
  @override
  Widget build(BuildContext context) {
    Game game = Provider.of<Game>(context);

    return MaterialApp(
      home: Scaffold(
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
              Column(children: <Widget>[CharacterMap()]),
            ],
          ),
        ),
      ),
    );
  }
}
