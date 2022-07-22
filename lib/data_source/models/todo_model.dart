class ToDoModel {
  late int id; 
  String content;
  String note;
  bool isDone;

  ToDoModel({
    required this.content,
    required this.note,
    required this.isDone,
  }){
     id=DateTime.now().microsecondsSinceEpoch;
  }
}
