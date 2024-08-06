import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.onChange,
    required this.fontSize,
    this.text,
    this.readOnly,
    this.autoFocus,
  });

  final String hint;
  final Function(String?)? onChange;
  final double fontSize;
  final String? text;
  final bool? readOnly;
  final bool? autoFocus;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      autofocus: autoFocus ?? false,
      controller: TextEditingController(text: text),
      readOnly: readOnly ?? false,
      onChanged: onChange,
      style: TextStyle(fontSize: fontSize),
      maxLines: null,
      decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          hintStyle: TextStyle(fontSize: fontSize)),
    );
  }
}
