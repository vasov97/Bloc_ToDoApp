import 'package:flutter/material.dart';

class AddToDo extends StatelessWidget {
  const AddToDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add ToDo'),
      ),
    );
  }
}
