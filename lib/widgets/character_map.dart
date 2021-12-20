import 'package:flutter/material.dart';
import 'package:hangman/backend/alphabet.dart';
import 'package:hangman/backend/game.dart';
import 'package:hangman/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CharacterMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Game game = Provider.of<Game>(context);
    return Wrap(
      alignment: WrapAlignment.center,
      children: generateCharacters(game),
    );
  }

  List<Widget> generateCharacters(Game game) {
    List<Widget> characters = [];

    for (String character in alphabet) {
      characters.add(CharacterInput(
        shouldBeVisible:
            game.inputhandler.availableCharacters.contains(character),
        character: character,
        onPress: () => game.playRound(character),
      ));
    }

    return characters;
  }
}
