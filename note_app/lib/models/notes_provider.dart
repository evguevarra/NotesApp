import 'package:flutter/material.dart';
import 'package:note_app/models/note.dart';

class NotesProvider extends ChangeNotifier {
  final List<Note> _notes = <Note>[];

  List<Note> get getNotes {
    return _notes;
  }

  NotesProvider() {
    addNewNote('Hello', 'World!');
  }

  void addNewNote(String title, String description) {
    Note note = Note(title: title, description: description);
    _notes.add(note);
    notifyListeners();
  }
}
