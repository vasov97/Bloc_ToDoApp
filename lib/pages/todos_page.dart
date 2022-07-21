import 'package:flutter/material.dart';

import '../widgets/todo_item.dart';

class ToDosPage extends StatefulWidget {
  const ToDosPage({Key? key}) : super(key: key);

  @override
  State<ToDosPage> createState() => _ToDosPageState();
}

class _ToDosPageState extends State<ToDosPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ToDoItem(
            content: 'Task 1',
            note: 'note',
            isDone: false,
          ),
          ToDoItem(
            content: 'Task 2',
            note: 'note 2',
            isDone: true,
          ),
        ],
      ),
    );
  }
}
