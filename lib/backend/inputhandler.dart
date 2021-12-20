import 'dart:io';

class Inputhandler {
  getGuess() {
    print('Enter character to guess: ');
    //TODO: change to get character from flutter UI, remove ability to enter same character more than once.
    return stdin.readLineSync();
  }
}
