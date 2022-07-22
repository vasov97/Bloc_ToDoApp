import 'package:equatable/equatable.dart';
import 'package:todoapp_bloc/data_source/models/todo_model.dart';

abstract class ToDoState extends Equatable {
  final List<ToDoModel> toDos;

  ToDoState({this.toDos = const []});

  @override
  List<Object> get props => [];
}

class ToDosLoading extends ToDoState {}

class ToDosLoaded extends ToDoState {
  final List<ToDoModel> toDos;

  ToDosLoaded({this.toDos = const <ToDoModel>[]});

  @override
  List<Object> get props => [toDos];
}
