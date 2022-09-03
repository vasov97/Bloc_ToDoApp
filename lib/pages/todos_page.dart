import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_bloc/blocs/todo_bloc.dart';

import '../data_source/models/todo_model.dart';
import '../widgets/todo_item.dart';

class ToDosPage extends StatelessWidget {
  ToDosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToDoBloc toDoBloc = context.read<ToDoBloc>();
    return StreamBuilder<List<ToDoModel>>(
      stream: toDoBloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          if (data!.isEmpty) {
            const Center(
              child: Text('Error happened'),
            );
          }
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                child: ToDoItem(toDoModel: data[index]),
                onDismissed: (item) => toDoBloc.removeTodo(data[index]),
              );
            },
          );
        } else {
          return const Center(child: Text('Error happened'));
        }
      },
    );
  }
}
