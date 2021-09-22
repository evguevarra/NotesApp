import 'package:flutter/material.dart';
import 'package:note_app/models/notes_provider.dart';
import 'package:note_app/views/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotesProvider>(
      create: (context) => NotesProvider(),
      child: MaterialApp(
        title: 'NoteIt',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
