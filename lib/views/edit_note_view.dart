import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/preview_note_view.dart';
import 'package:notes_app/widgets/add_note_form.dart';
import 'package:notes_app/widgets/custom_icon.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key});

  static String id = "EditNoteView";

  @override
  State<EditNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<EditNoteView> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    NoteModel note = ModalRoute.of(context)?.settings.arguments as NoteModel;
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
                icon: Icons.check,
                onPressed: () {
                  note.title = title ?? note.title;
                  note.content = content ?? note.content;
                  note.save();
                  Navigator.pushReplacementNamed(
                    context,
                    PreviewNoteView.id,
                    arguments: note,
                  );
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: AddNoteForm(
            readOnly: false,
            onChangeTitle: (value) {
              title = value ?? "UnTitled";
            },
            note: note,
            onChangeContent: (value) {
              content = value ?? "";
            },
          ),
        ));
  }
}
