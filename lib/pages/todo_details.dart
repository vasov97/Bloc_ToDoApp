import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_bloc/blocs/todo_bloc.dart';
import 'package:todoapp_bloc/widgets/todo_item.dart';

import '../data_source/models/todo_model.dart';
import 'edit_todo.dart';

class ToDoDetails extends StatelessWidget {
  ToDoDetails({Key? key, required this.toDoModel}) : super(key: key);
  ToDoModel toDoModel;

  @override
  Widget build(BuildContext context) {
    ToDoBloc toDoBloc = context.read<ToDoBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo Details'),
        actions: [
          IconButton(
            onPressed: () {
              toDoBloc.removeTodo(toDoModel);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditToDoPage(
                      toDoModel: toDoModel,
                    ))),
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.edit,
          color: Colors.black38,
        ),
      ),
      body: ToDoItem(
        toDoModel: toDoModel,
      ),
    );
  }
}
