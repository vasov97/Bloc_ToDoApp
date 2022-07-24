import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/todo_bloc.dart';

class StatsPage extends StatelessWidget {
  StatsPage({Key? key}) : super(key: key);

  String completed = '';
  String active = '';
  late final ToDoBloc toDoBloc;

  getData(ToDoBloc toDoBloc) {
    completed = toDoBloc.toDoRepository.data.showCompleted().length.toString();
    active = toDoBloc.toDoRepository.data.showActive().length.toString();
  }

  @override
  Widget build(BuildContext context) {
    toDoBloc = context.read<ToDoBloc>();
    getData(toDoBloc);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Completed ToDos\n',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              completed,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            const Text(
              'Active ToDos\n',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              active,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
