import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/models/Task.dart';

List<Task> tasks = [
  Task(1, "Understand Flutter", false,
      faker.date.dateTime(minYear: 2022, maxYear: 2100)),
  Task(2, "Understand Dart", false,
      faker.date.dateTime(minYear: 2022, maxYear: 2100)),
  Task(3, "Understand Something", false,
      faker.date.dateTime(minYear: 2022, maxYear: 2100)),
  Task(4, "Understand where is the classroom", true,
      faker.date.dateTime(minYear: 2022, maxYear: 2100)),
];

// ListView(
//   children: const <Widget>[
//     ListTile(
//       title: Text('Understand Flutter')
//     ),
//     ListTile(
//       title: Text('Understand Dart')
//     ),
//     ListTile(
//       title: Text('Understand Something')
//     ),
//   ],
// ),
