import 'package:flutter/material.dart';
import 'package:note_app/models/note.dart';

class NotesCard extends StatelessWidget {
  final Note note;

  const NotesCard({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.yellow,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(note.description),
          ],
        ),
      ),
    );
  }
}
