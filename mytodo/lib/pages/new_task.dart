import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  final void Function(String) onSave;

  const NewTask({super.key, required this.onSave});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {

TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Tarefa'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite o título',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => {
              widget.onSave(controller.text),
              Navigator.pop(context)
              },
            child: Text('Gravar'),
          ),
        ],
      ),
    );
  }
}
