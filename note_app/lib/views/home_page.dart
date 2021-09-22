import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_app/database/note_database.dart';
import 'package:note_app/model/note.dart';
import 'package:note_app/views/add_edit_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Icon(Icons.edit, color: Colors.blueGrey.shade600),
            const SizedBox(
              width: 7,
            ),
            Text(
              "Note It",
              style: TextStyle(
                color: Colors.blueGrey.shade800,
              ),
            ),
          ],
        ),
      ),
      body: Center(
          child: FutureBuilder<List<Note>>(
              future: DatabaseHelper.instance.getNotes(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: Text('Loading...'));
                }
                return snapshot.data!.isEmpty
                    ? const Center(child: Text('No Notes.'))
                    : ListView(
                        children: snapshot.data!.map((note) {
                          return Center(
                            child: ListTile(
                              title: Text(note.title),
                            ),
                          );
                        }).toList(),
                      );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddEditPage()));
        },
        backgroundColor: Colors.blueGrey.shade600,
        child: const Icon(Icons.add),
      ),
    );
  }
}
