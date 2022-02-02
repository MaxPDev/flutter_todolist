import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';

class TaskPreview extends StatelessWidget {
  const TaskPreview({Key? key, required this.task}) : super(key: key);
  //constrcuteur
  final Task task;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(Icons.check_box_outline_blank_rounded),
        title: Text(task.content),
        // subtitle: Text('Created at ${task.createdAt}'),
        subtitle: !task.completed ? Text('Do it now') : Text('TO DO'),
        trailing: const Icon(Icons.drag_handle_rounded),
        tileColor: !task.completed ? Colors.yellow : Colors.lightGreenAccent);
  }
}
