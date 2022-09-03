import 'data/data.dart';
import 'models/todo_model.dart';

class ToDoRepository {
  final Data _data = Data();

  Data get data => _data;

  Future<void> addToDo(ToDoModel toDoModel) async => _data.addToDo(toDoModel);

  Future<void> clearCompleted() async => _data.clearCompleted();

  Future<void> deleteToDo(ToDoModel toDoModel) async =>
      _data.deleteToDo(toDoModel);

  Future<List<ToDoModel>> getToDos() async => _data.toDos;

  Future<void> markAllComplete() async => _data.markAllComplete();

  Future<List<ToDoModel>> showActive(List<ToDoModel> items) async =>
      _data.showActive();

  Future<List<ToDoModel>> showCompleted(List<ToDoModel> items) async =>
      _data.showCompleted();

  Future<void> editToDo(int id, String content, String note) async {
    _data.editToDo(content, note, id);
  }
 
  Future<ToDoModel> checkToDo(ToDoModel toDoModel, bool isDone) async =>
      _data.checkToDo(toDoModel, isDone);
}
