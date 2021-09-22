import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_app/models/notes_provider.dart';
import 'package:note_app/views/add_edit_page.dart';
import 'package:note_app/widgets/notes_card.dart';
import 'package:provider/provider.dart';

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
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Consumer<NotesProvider>(
            builder: (context, NotesProvider data, child) {
          return ListView.builder(
              itemCount: data.getNotes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                  child: NotesCard(
                    note: data.getNotes[index],
                  ),
                );
              });
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddEditPage()));
        },
        backgroundColor: Colors.blueGrey.shade600,
        child: const Icon(Icons.add),
      ),
    );
  }
}
