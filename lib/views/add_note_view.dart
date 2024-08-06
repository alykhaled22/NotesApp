import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/preview_note_view.dart';
import 'package:notes_app/widgets/add_note_form.dart';
import 'package:notes_app/widgets/custom_icon.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({super.key});

  static String id = "AddNoteView";

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  String? title, content;
  late NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFaliure) {}

        if (state is AddNoteSuccess) {
          Navigator.pushReplacementNamed(
            context,
            PreviewNoteView.id,
            arguments: noteModel,
          );
          BlocProvider.of<NotesCubit>(context).fetchAllNotes();
        }
      },
      builder: (context, state) {
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
                  child: BlocBuilder<AddNoteCubit, AddNoteState>(
                    builder: (context, state) {
                      return CustomIcon(
                        icon: Icons.check,
                        onPressed: () {
                          var currentDate = DateTime.now();
                          var formattedCurrentDate =
                              DateFormat('MMMM d, yyyy').format(currentDate);
                          noteModel = NoteModel(
                              title: title ?? "UnTitled",
                              content: content ?? "",
                              date: formattedCurrentDate,
                              color: Colors.blue.value);
                          BlocProvider.of<AddNoteCubit>(context)
                              .addNote(noteModel);
                        },
                      );
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
                  title = value;
                },
                onChangeContent: (value) {
                  content = value;
                },
              ),
            ));
      },
    );
  }
}
