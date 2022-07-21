class ToDoModel {
  final int id;
  final String content;
  final String note;
  final bool isDone;

  ToDoModel({
    required this.id,
    required this.content,
    required this.note,
    required this.isDone,
  });

  ToDoModel.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        content = data['content'],
        note = data['note'],
        isDone = data['isDone'];

  Map<String, dynamic> toMap() {
    return {'id': id, 'content': content, 'note': note, 'isDone': isDone};
  }
}
