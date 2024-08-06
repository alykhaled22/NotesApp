import 'package:flutter/material.dart';

import 'package:notes_app/views/add_note_view.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  static String id = "NotesView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddNoteView.id);
        },
        child: const Icon(
          Icons.edit_note_rounded,
          size: 32,
          //size: ,
        ),
      ),
      body: const NotesViewBody(),
    );
  }
}
