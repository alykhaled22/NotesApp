import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatelessWidget {
  const AddNoteForm({
    super.key,
    required this.readOnly,
    this.onChangeTitle,
    this.onChangeContent,
    this.note,
  });

  final bool readOnly;
  final Function(String?)? onChangeTitle;
  final Function(String?)? onChangeContent;
  final NoteModel? note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          CustomTextField(
            readOnly: readOnly,
            autoFocus: true,
            onChange: onChangeTitle,
            fontSize: 32,
            hint: "Title",
            text: note?.title,
          ),
          const SizedBox(height: 30),
          CustomTextField(
            readOnly: readOnly,
            onChange: onChangeContent,
            fontSize: 18,
            hint: "Type something...",
            text: note?.content,
          ),
        ],
      ),
    );
  }
}
