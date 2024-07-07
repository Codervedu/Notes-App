import 'package:flutter/cupertino.dart';

import '../model/note.dart';

class NoteProvider extends ChangeNotifier {
  List<Note> notes = [];

  void addNote(Note note) {
    notes.add(note);
    notifyListeners();
  }

  void updateNote(Note note) {
    late int index;
    // int index = notes.indexOf(
    //     notes.firstWhere((element) => element.user_id == note.user_id));
    for (int i = 0; i < notes.length; i++) {
      if (notes[i].note_id == note.note_id) {
        index = i;
        break;
      }
    }

    notes[index] = note;
    notifyListeners();
  }

  void deleteNote(Note note) {
    late int index;
    // int index = notes.indexOf(
    //     notes.firstWhere((element) => element.user_id == note.user_id));
    for (int i = 0; i < notes.length; i++) {
      if (notes[i].note_id == note.note_id) {
        index = i;
        break;
      }
    }

    notes.removeAt(index);
    notifyListeners();
  }
}
