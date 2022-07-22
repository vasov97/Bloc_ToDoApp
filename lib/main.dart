import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_bloc/data_source/todo_repository.dart';
import 'package:todoapp_bloc/pages/add_todo.dart';
import 'package:todoapp_bloc/pages/home_page.dart';

import 'blocs/todo_bloc.dart';

void main() => BlocOverrides.runZoned(() => runApp(const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<ToDoBloc>(
      create: (context) =>
          ToDoBloc(toDoRepository: ToDoRepository())..getToDos(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        routes: {
          '/': (BuildContext context) => const HomePage(),
          '/add': (BuildContext context) => AddToDoPage(),
        },
      ),
    );
  }
}
