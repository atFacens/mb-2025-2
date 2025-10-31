import 'dart:io';

import 'package:mytodo/model/task_item.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TaskDB {
  TaskDB._();

  static final TaskDB db = TaskDB._();

  Database? _database;

  Future<Database?> get database async {
    if(_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TaskDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE TaskItem ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "title TEXT,"
          "done BIT"
          ")");
    });
  }

  Future<int> newTask(TaskItem task) async {
    final db = await database;

    var raw = await db!.rawInsert(
        "INSERT Into TaskItem (title, done)"
        " VALUES (?,?)",
        [task.title, task.done]);

    return raw;
  }

  Future<List<TaskItem>> getAll() async {
    final db = await database;

    var res = await db!.query("TaskItem");

    List<TaskItem> list =
        res.isNotEmpty ? res.map((c) => TaskItem.fromMap(c)).toList() : [];

    return list;
  }

  Future<void> completeTask(TaskItem task) async {
    final db = await database;

    task.done = !task.done;
    await db!.update("TaskItem", task.toMap(), where: "id=?", whereArgs: [task.id]);
  }

  Future<void> delete(TaskItem task) async {
    final db = await database;

    await db!.delete("TaskItem", where: "id=?", whereArgs: [task.id] );
  }

  Future<void> deleteAll() async {
    final db = await database;

    await db!.delete("TaskItem");
  }
}