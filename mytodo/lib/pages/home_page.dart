import 'package:flutter/material.dart';
import 'package:mytodo/components/task_card.dart';
import 'package:mytodo/model/task_item.dart';
import 'package:mytodo/pages/new_task.dart';
import 'package:mytodo/repo/task_db.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TaskItem> tasks = [];

  @override
  void initState() {
    super.initState();
    updateTaskList();
  }

  void updateTaskList() async {
    tasks = await TaskDB.db.getAll();
    setState(() {
    });
  }

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
                return TaskCard(task: tasks[index], onUpdate: updateTaskList);
              },
            ),
          ),
        ],
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'novo',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewTask(onSave: updateTaskList)),
            ),
            child: const Icon(Icons.add),
          ),
          SizedBox(width: 12,),
          FloatingActionButton(
            heroTag: 'delete',
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            child: const Icon(Icons.delete_sweep_outlined,),
            onPressed: () => {
              _showConfirmation()
            },
          ),
        ],
      ),
    );
  }

  Future<Future<dynamic>> _showConfirmation() async {
    return showDialog(context: context, 
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ATENÇÃO!'),
          content: Text('Você quer realmente apagar TODAS as tarefas?'),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Cancelar')),
            TextButton(onPressed: () async {
              await TaskDB.db.deleteAll();
              updateTaskList();
              Navigator.pop(context);
            }, child: Text('Apagar'))
          ],);
      });
  }
}
