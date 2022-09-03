import 'package:todoapp_bloc/data_source/models/todo_model.dart';

class Data {
  List<ToDoModel> _toDos = [
    ToDoModel(content: 'content1', note: 'note1', isDone: false),
    ToDoModel(content: 'content2', note: 'note2', isDone: true),
    ToDoModel(content: 'content2', note: 'note2', isDone: false),
  ];

  List<ToDoModel> get toDos => _toDos;
  set toDos(List<ToDoModel> newList) => _toDos = newList;

  List<ToDoModel> showActive() {
    List<ToDoModel> stillActive = [];
    for (ToDoModel toDo in toDos) {
      if (!toDo.isDone) {
        stillActive.add(toDo);
      }
    }
    return stillActive;
  }

  List<ToDoModel> showCompleted() {
    List<ToDoModel> completed = [];
    for (ToDoModel toDo in toDos) {
      if (toDo.isDone) {
        completed.add(toDo);
      }
    }
    return completed;
  }

  void clearCompleted() =>
      toDos.removeWhere((element) => element.isDone == true);

  void addToDo(ToDoModel newToDo) => toDos.add(newToDo);

  void deleteToDo(ToDoModel toDoModel) => toDos.remove(toDoModel);

  void editToDo(String content, String note, int id) {
    int index = toDos.indexWhere((element) => element.id == id);
    toDos[index].content = content;
    toDos[index].note = note;
  }

  ToDoModel checkToDo(ToDoModel toDoModel, bool isDone) {
    int index = toDos.indexWhere((element) => element.id == toDoModel.id);
    ToDoModel toDo = toDos[index];
    toDo.isDone = isDone;
    return toDo;
  }

  void markAllComplete() {
    for (ToDoModel toDo in toDos) {
      toDo.isDone = true;
    }
  }
}

