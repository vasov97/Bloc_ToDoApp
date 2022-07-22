import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:todoapp_bloc/data_source/todo_repository.dart';

import '../data_source/models/todo_model.dart';

class ToDoBloc {
  final ToDoRepository toDoRepository;
  final BehaviorSubject<List<ToDoModel>> controller =
      BehaviorSubject<List<ToDoModel>>();
  Stream<List<ToDoModel>> get stream => controller.stream;

  ToDoBloc({required this.toDoRepository});

  Future<void> showActive(ToDoModel todo) async {
    final List<ToDoModel> completedToDos = [];
    List<ToDoModel> list = await toDoRepository.getToDos();
    for (ToDoModel toDo in list) {
      if (!toDo.isDone) completedToDos.add(toDo);
    }
    controller.sink.add(completedToDos);
  }

  void showCompleted() async {
    final List<ToDoModel> completedToDos = [];
    List<ToDoModel> list = await toDoRepository.getToDos();
    for (ToDoModel toDo in list) {
      if (toDo.isDone) completedToDos.add(toDo);
    }
    controller.sink.add(completedToDos);
  }

  Future<void> markAllComplete() async {
    await toDoRepository.markAllComplete();
    controller.sink.add(await toDoRepository.getToDos());
  }

  Future<void> getToDos() async {
    await toDoRepository.getToDos().then((value) => controller.sink.add(value));
  }

  Future<void> addTodo(ToDoModel todo) async {
    await toDoRepository.addToDo(todo);
    controller.sink.add(await toDoRepository.getToDos());
  }

  Future<void> removeTodo(ToDoModel todo) async {
    await toDoRepository.deleteToDo(todo);
    controller.sink.add(await toDoRepository.getToDos());
  }

  Future<void> clearAllCompleted() async {
    await toDoRepository.clearCompleted();
    controller.sink.add(await toDoRepository.getToDos());
  }

  Future<void> editToDo(String content, String note, int id) async {
    await toDoRepository.editToDo(id, content, note);
    controller.sink.add(await toDoRepository.getToDos());
  }

  void dispose() {
    controller.close();
  }
}
