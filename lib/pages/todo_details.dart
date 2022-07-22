import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_bloc/blocs/todo_bloc.dart';
import 'package:todoapp_bloc/widgets/todo_item.dart';

import '../data_source/models/todo_model.dart';
import 'edit_todo.dart';

/*
User can Delete the Todo by tapping the Icon in the top-right of the screen.
When the button is tapped, the details Screen should be closed and
the user should be presented with the List of Todos.
A SnackBar must be displayed with the Title of the Todo that was
just removed and a button to Undo this action. When the Undo button is clicked,
the removed item should be appended to the end of the Todo List.
* */

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
