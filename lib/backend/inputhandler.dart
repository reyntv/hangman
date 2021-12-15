import 'dart:io';

class Inputhandler {
  getGuess() {
    print('Enter character to guess: ');
    //TODO: change to get character from flutter UI
    return stdin.readLineSync();
  }
}
