import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/tasks/task_form.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:todolist/models/task.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({Key? key}) : super(key: key);

  static String get route => '/create_task';

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Créer une nouvelle tâche'),
        ),
        body: Consumer<TasksCollection>(
          builder: (context, tasksCollection, child) {
            return TaskForm(
              onChangeTask: (content, complete, createdAt) {
                setState(() {
                  int id = tasksCollection.lengthListTasks();
                  Task task = Task(id, content, complete, createdAt);
                  tasksCollection.createTask(task);
                });
              },
            );
          },
        ));
  }
}
