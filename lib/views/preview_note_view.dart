import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/widgets/add_note_form.dart';
import 'package:notes_app/widgets/custom_icon.dart';

class PreviewNoteView extends StatelessWidget {
  const PreviewNoteView({super.key});

  static String id = "PreviewNoteView";

  @override
  Widget build(BuildContext context) {
    NoteModel note = ModalRoute.of(context)!.settings.arguments as NoteModel;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          titleSpacing: 20,
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: CustomIcon(
            icon: Icons.chevron_left,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: CustomIcon(
                icon: Icons.edit,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, EditNoteView.id,
                      arguments: note);
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: AddNoteForm(
            readOnly: true,
            note: note,
          ),
        ));
  }
}
