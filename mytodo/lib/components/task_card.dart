import 'package:flutter/material.dart';
import 'package:mytodo/model/task_item.dart';
import 'package:mytodo/repo/task_db.dart';

class TaskCard extends StatefulWidget {
  final void Function() onUpdate;
  final TaskItem task;

  const TaskCard({super.key, required this.task, required this.onUpdate});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.task.title,
              style: TextStyle(
                decoration: (widget.task.done)
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.check),
                  color: (widget.task.done) ? Colors.grey : Colors.green,
                  onPressed: () {
                    TaskDB.db.completeTask(widget.task);
                    widget.onUpdate();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    TaskDB.db.delete(widget.task);
                    widget.onUpdate();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
