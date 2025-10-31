class TaskItem {
  int id;
  String title;
  bool done;

  TaskItem({this.id=0, required this.title, this.done = false});

  factory TaskItem.fromMap(Map<String, dynamic> json) => TaskItem(
        id: json["id"],
        title: json["title"],
        done: json["done"] == 1
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "done": done ? 1 : 0,
  };
}
