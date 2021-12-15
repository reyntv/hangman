import 'dart:io';

class Wordbank {
  List<String> words;

  Wordbank(filename) {
    words = File(filename).readAsLinesSync();
    words.shuffle();
  }

  String getWord() {
    String word = words[0];
    words.removeAt(0);

    return word;
  }
}
