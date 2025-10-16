import 'package:flutter/material.dart';
import 'package:mytodo/model/task_item.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});

  final TaskItem task;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(task.tile),
            Row(
              children: [
                IconButton(icon: Icon(Icons.check), onPressed: () {}),
                IconButton(icon: Icon(Icons.delete), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
