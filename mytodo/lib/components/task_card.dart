import 'package:flutter/material.dart';
import 'package:mytodo/model/task_item.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key, required this.task});

  final TaskItem task;

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
                    setState(() {
                      widget.task.done = !widget.task.done;
                    });
                  },
                ),
                IconButton(icon: Icon(Icons.delete), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
