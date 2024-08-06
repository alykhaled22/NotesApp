import 'package:flutter/material.dart';

class EmptyNotesListHolder extends StatelessWidget {
  const EmptyNotesListHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 6),
      child: Column(
        children: [
          Image.asset("assets/images/rafiki.png"),
          const Text(
            "Create your first note!",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
