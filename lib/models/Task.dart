import 'package:flutter/cupertino.dart';

class Task {
  int id;
  String content;
  bool completed;
  DateTime? createdAt;

  Task(this.id, this.content, this.completed, this.createdAt) {}
}
