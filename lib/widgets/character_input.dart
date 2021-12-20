import 'package:flutter/material.dart';

class CharacterInput extends StatelessWidget {
  CharacterInput({this.character, this.onPress});

  final String character;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(character),
      onPressed: onPress,
    );
  }
}