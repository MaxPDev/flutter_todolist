import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';

class TaskPreview extends StatelessWidget {
  const TaskPreview(
      {Key? key, required this.task, required this.onTaskPreviewTap})
      : super(key: key);
  //constrcuteur
  final Task task;

  // final VoidCallback onTaskPreviewTap;
  final Function onTaskPreviewTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: !task.completed
            ? const Icon(Icons.check_box_outline_blank_rounded)
            : const Icon(Icons.check_box_rounded),
        // subtitle: Text('Created at ${task.createdAt}'),
        title: Text(task.content),
        subtitle: !task.completed
            ? Text('TO DO ___ Created at ${task.createdAt}')
            : Text('Done ___ Created at ${task.createdAt}'),
        trailing: const Icon(Icons.drag_handle_rounded),
        onTap: () {
          onTaskPreviewTap(task);
        },
        tileColor: !task.completed ? Colors.yellow : Colors.lightGreenAccent);
  }
}
