import 'package:flutter/material.dart';

import 'edit_todo.dart';

class ToDoDetails extends StatefulWidget {
  const ToDoDetails({Key? key}) : super(key: key);

  @override
  State<ToDoDetails> createState() => _ToDoDetailsState();
}

class _ToDoDetailsState extends State<ToDoDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo Details'),
        actions: const [
          Icon(Icons.delete),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const EditToDo())),
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.edit,
          color: Colors.black38,
        ),
      ),
    );
  }
}
