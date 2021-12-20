class Wordhandler {
  List<String> currentWord;
  List<String> displayWord;

  Wordhandler(String currentWord) {
    initWord(currentWord);
  }

  void initWord(String currentWord) {
    this.currentWord = currentWord.split('');
    initDisplayWord();
  }

  bool checkChar(String character) {
    return currentWord.contains(character);
  }

  void addChar(String character) {
    for (int i = 0; i < currentWord.length; i++) {
      if (currentWord[i] == character) {
        displayWord[i] = character;
      }
    }
  }

  void initDisplayWord() {
    List<String> displayWord = [];

    for (String char in currentWord) {
      displayWord.add('_');
    }

    this.displayWord = displayWord;
  }

  String display() {
    return displayWord.join(' ');
  }

  bool checkMatch() {
    return displayWord.join('') == currentWord.join('');
  }

  void reset() {
    currentWord = [];
    displayWord = [];
  }
}
