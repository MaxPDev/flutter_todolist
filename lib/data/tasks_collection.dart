import 'package:flutter/material.dart';
import 'package:todolist/data/tasks.dart' as data;

import 'package:todolist/models/task.dart';
import 'package:dio/dio.dart';

class TasksCollection extends ChangeNotifier {
  final List<Task> _tasks = data.tasks;
  String uriAPI = "https://jsonplaceholder.typicode.com/todos";

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

  // void getHttp() async {
  //   try {
  //     var response = await Dio().get(uriAPI);
  //     print(response);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future getAllTasksFromAPI() async {
    var response = await Dio().get('https://jsonplaceholder.typicode.com/todos',
        options: Options(headers: {
          Headers.contentTypeHeader: 'application/json',
          Headers.acceptHeader: 'application/json'
        }));
    List task = response.data;
    List task5 = task.getRange(1, 5).toList();
    _tasks.addAll(task5.map((i) => Task.fromJson(i)).toList());
    notifyListeners();
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
  List<Task> getAllTasksSortByName() {
    _tasks.sort(((a, b) => a.createdAt!.compareTo(b.createdAt!)));
    notifyListeners();
    return _tasks;
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

  int getNewId() {
    return _tasks.length + 1;
  }
}
