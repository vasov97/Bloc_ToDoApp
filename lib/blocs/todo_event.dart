import 'package:equatable/equatable.dart';

import '../data_source/models/todo_model.dart';

abstract class ToDoEvent extends Equatable {
  ToDoEvent();

  @override
  List<Object> get props => [];
}

class LoadToDos extends ToDoEvent {
  final List<ToDoModel> toDos;

  LoadToDos({required this.toDos});
}

class AddToDo extends ToDoEvent {
  ToDoModel toDoModel;
  AddToDo({required this.toDoModel});
}

class EditToDo extends ToDoEvent {
  ToDoModel toDoModel;
  EditToDo({required this.toDoModel});
}

class DeleteToDo extends ToDoEvent {
  ToDoModel toDoModel;
  DeleteToDo({required this.toDoModel});
}
