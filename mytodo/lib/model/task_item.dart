class TaskItem {
  String id;
  String title;
  bool done;

  TaskItem({this.id='', required this.title, this.done = false});

  factory TaskItem.fromMap(Map<String, dynamic> json) => TaskItem(
        id: json["id"],
        title: json["title"],
        done: json["done"]
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "done": done,
  };
}
