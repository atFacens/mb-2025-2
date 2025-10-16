import 'package:flutter/material.dart';
import 'package:mytodo/components/task_card.dart';
import 'package:mytodo/model/task_item.dart';
import 'package:mytodo/pages/new_task.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TaskItem> tasks = [
    TaskItem(tile: 'Primeira tarefa'),
    TaskItem(tile: 'Segunda tarefa'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskCard(task: tasks[index]);
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: 
        () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewTask()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}


