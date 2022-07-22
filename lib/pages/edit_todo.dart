import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_bloc/data_source/todo_repository.dart';

import '../blocs/todo_bloc.dart';
import '../data_source/models/todo_model.dart';
/*
* In order to make changes to the todo,
* the task field must not be empty. Make sure to .trim() the input and then check
* that it's not empty before updating the todo. If the task contains no text,
* show an error..*/

class EditToDoPage extends StatelessWidget {
  EditToDoPage({Key? key, required this.toDoModel}) : super(key: key);
  ToDoModel toDoModel;
  ToDoRepository toDoRepository = ToDoRepository();

  final TextEditingController _todoController = TextEditingController();

  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _todoController.text = toDoModel.content;
    _noteController.text = toDoModel.note;
    ToDoBloc toDoBloc = context.read<ToDoBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit ToDo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: toDoModel.content),
                  autofocus: false,
                  key: const ValueKey('addToDo'),
                  controller: _todoController,
                  validator: (String? value) {
                    if (value!.isNotEmpty) {
                      toDoModel.content = value;
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text('Additional Notes...')),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Expanded(
            child: TextFormField(
              key: const ValueKey('addNote'),
              controller: _noteController,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toDoBloc.editToDo(
              _todoController.text, _noteController.text, toDoModel.id);

          Navigator.pop(context);
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.check),
      ),
    );
  }
}
