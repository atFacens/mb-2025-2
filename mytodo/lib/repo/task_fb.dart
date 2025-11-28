import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mytodo/model/task_item.dart';

class TaskFB {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> create(TaskItem task) async {
    final newTaskRef = _firestore.collection('tasks').doc();
    task.id = newTaskRef.id;
    await newTaskRef.set(task.toMap());
  }

  Future<List<TaskItem>> read() async {
    var future = await _firestore
        .collection('tasks')
        .withConverter(
          fromFirestore: (snapshot, _) => TaskItem.fromMap(snapshot.data()!),
          toFirestore: (task, _) => task.toMap(),
        )
        .get();

    var data = future.docs;

    List<TaskItem> tasks = data.map((e)=>e.data()).toList();

    return tasks;
  }
}
