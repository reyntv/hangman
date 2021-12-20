class Wordbank {
  List<String> words;

  Wordbank(List<String> wordbankDifficulty) {
    words = wordbankDifficulty;
    words.shuffle();
  }

  String getWord() {
    String word = words[0];
    words.removeAt(0);

    return word;
  }
}
