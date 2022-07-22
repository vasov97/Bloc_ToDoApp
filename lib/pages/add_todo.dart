import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_bloc/blocs/todo_bloc.dart';
import 'package:todoapp_bloc/data_source/models/todo_model.dart';

class AddToDoPage extends StatelessWidget {
  late final TextEditingController _todoController;
  late final TextEditingController _noteController;

  AddToDoPage({Key? key}) : super(key: key) {
    _todoController = TextEditingController(text: 'What needs to be done?');
    _noteController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    ToDoBloc toDoBloc = context.read<ToDoBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add ToDo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  autofocus: true,
                  key: const ValueKey('addToDo'),
                  controller: _todoController,
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
          ToDoModel newToDo = ToDoModel(
              content: _todoController.value.text,
              note: _noteController.value.text,
              isDone: false);
          toDoBloc.addTodo(newToDo);
          Navigator.pop(context);
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
          color: Colors.black38,
        ),
      ),
    );
  }
}
