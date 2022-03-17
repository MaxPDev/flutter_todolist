import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  int id;
  String content;
  bool completed;
  DateTime? createdAt;

  //? Late of note, that is the question

  Task(this.id, this.content, this.completed, this.createdAt);

  // factory Task.fromJson(Map<String, dynamic> json) {
  //   return Task(json['id'], json['title'], json['completed'], DateTime.now());
  // }

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
