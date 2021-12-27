import 'package:flutter/material.dart';
import 'package:hangman/backend/game.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Game game = Provider.of<Game>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Hangman'),
        ),
        body: SafeArea(
          child: CheckboxListTile(
            title: Text('Hard words'),
            value: game.settings.hardWords,
            onChanged: (bool value) {
              game.settings.hardWords = value;
              game.settingsChanged();
            },
          ),
        ));
  }
}
