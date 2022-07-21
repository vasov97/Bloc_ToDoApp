import 'package:flutter/material.dart';

class ToDoItem extends StatefulWidget {
  ToDoItem({required this.note, required this.content, required this.isDone});

  final String note;
  final String content;
  late bool isDone;

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

//dismisable dodaj
class _ToDoItemState extends State<ToDoItem> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.content.toString()),
      subtitle: Text(widget.note.toString()),
      controlAffinity: ListTileControlAffinity.leading,
      value: widget.isDone,
      onChanged: (bool? value) {
        setState(() {
          widget.isDone = value!;
        });
      },
    );
  }
}
