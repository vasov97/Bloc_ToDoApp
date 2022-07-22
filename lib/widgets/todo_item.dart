import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/todo_bloc.dart';
import '../data_source/models/todo_model.dart';
import '../pages/todo_details.dart';

class ToDoItem extends StatelessWidget {
  ToDoItem({required this.toDoModel});

  ToDoModel toDoModel;

  @override
  Widget build(BuildContext context) {
    ToDoBloc toDoBloc = context.read<ToDoBloc>();
    return ListTile(
      title: Text(toDoModel.content.toString()),
      subtitle: Text(toDoModel.note.toString()),
      leading: Checkbox(
        value: toDoModel.isDone,
        onChanged: (value) {
          //toggle
          toDoModel.isDone = value!;
        },
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ToDoDetails(
            toDoModel: toDoModel,
          ),
        ),
      ),
    );
  }
}
