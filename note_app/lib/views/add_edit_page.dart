import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:note_app/database/note_database.dart';
import 'package:note_app/model/note.dart';
import 'package:intl/intl.dart';

class AddEditPage extends StatefulWidget {
  const AddEditPage({Key? key}) : super(key: key);

  @override
  _AddEditPageState createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  //final DateTime now = DateTime.now();
  //final DateFormat formatter = DateFormat('yyyy-MM-dd');
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.blueGrey.shade600,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Add/Edit Note',
          style: TextStyle(
            color: Colors.blueGrey.shade800,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await DatabaseHelper.instance.add(
                Note(
                  title: titleController.text,
                  description: descriptionController.text,
                  createdTime: formattedDate,
                ),
              );

              setState(() {
                titleController.clear();
                descriptionController.clear();
              });
              Navigator.of(context).pop();
            },
            child: const Text(
              'Save',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            buildTitle(),
            // const SizedBox(
            //   height: 8,
            // ),
            Divider(
              thickness: 2,
            ),
            SingleChildScrollView(child: buildDescription()),
            Divider(
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildTitle() {
    return TextFormField(
      controller: titleController,
      maxLines: 1,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Title',
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  TextFormField buildDescription() {
    return TextFormField(
      controller: descriptionController,
      maxLines: 10,
      style: const TextStyle(
        fontSize: 18,
        //fontWeight: FontWeight.bold,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Description',
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
