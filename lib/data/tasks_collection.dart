import 'package:flutter/material.dart';
import 'package:todolist/data/tasks.dart' as data;

import 'package:todolist/models/task.dart';

class TasksCollection extends ChangeNotifier {
  final List<Task> _tasks = data.tasks;

  // //Add task
  // void add(Task task) {
  //   _tasks.insert(0, task);
  //   notifyListeners();
  // }

  // Create Task
  void createTask(Task task) {
    _tasks.add(task);
    notifyListeners(); // envoyer une notifs aux "abonné" avec Consumer<TaskCollection>
  }

  // Get all tasks
  List<Task> getAllTasks() {
    print('ok');
    return _tasks;
  }

  // Update task
  void updateTask(Task newTask) {
    _tasks[_tasks.indexWhere((item) => item.id == newTask.id)] = newTask;
    notifyListeners();
  }

  // // Delete Task
  // void deleteTask(Task task) {
  //   _tasks.removeWhere((item) => item.id == task.id);
  //   notifyListeners();
  // }

  // Delete Task
  void deleteTask(int taskId) {
    _tasks.removeWhere((item) => item.id == taskId);
    //! RemoveAt : modifie à l'index, voulu, mais ici c'est différent, il faut trouver la key id, par l'id, du coup removeWhere
    notifyListeners();
  }

  // Sort by name
  void sortByName() {
    _tasks.sort(((a, b) => a.content.compareTo(b.content)));
    notifyListeners();
  }

  // Sort by status
  void sortByStatus() {
    _tasks.sort((a, b) {
      if (a.completed == b.completed) {
        return 0;
      } else if (b.completed) {
        return -1;
      }
      return 1;
    });
    notifyListeners();
  }

  int lengthListTasks() {
    return _tasks.length;
  }
}
