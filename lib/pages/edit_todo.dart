import 'package:flutter/material.dart';
import 'package:todoapp_bloc/pages/todo_details.dart';
/*
* Make sure to .trim() the input and then check that
*  it's not empty before updating
* the todo.
* If the task contains no text, show an error.*/

class EditToDo extends StatefulWidget {
  const EditToDo({Key? key}) : super(key: key);

  @override
  State<EditToDo> createState() => _EditToDoState();
}

class _EditToDoState extends State<EditToDo> {
  final TextEditingController _todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: TextFormField(
              key: const ValueKey('editToDo'),
              controller: _todoController,
            ),
          ),
          const Text('this is a note task'),
          Expanded(
            child: TextFormField(
              key: const ValueKey('editNote'),
              controller: _todoController,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ToDoDetails())),
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.check,
          color: Colors.black38,
        ),
      ),
    );
  }
}
