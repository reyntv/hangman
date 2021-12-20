import 'package:flutter/material.dart';

class CharacterInput extends StatelessWidget {
  CharacterInput({this.character, this.onPress, this.shouldBeVisible});

  final String character;
  final Function onPress;
  final bool shouldBeVisible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: shouldBeVisible,
      maintainState: true,
      maintainAnimation: true,
      maintainSize: true,
      child: TextButton(
        child: Text(character.toUpperCase()),
        onPressed: onPress,
      ),
    );
  }
}
