import 'package:faker/faker.dart';
import 'package:todolist/models/task.dart';

List<Task> tasks = [
  Task(1, "Understand Flutter", false,
      faker.date.dateTime(minYear: 2022, maxYear: 2100)),
  Task(2, "Understand Dart", false,
      faker.date.dateTime(minYear: 2022, maxYear: 2100)),
  Task(3, "Understand Something", false,
      faker.date.dateTime(minYear: 2022, maxYear: 2100)),
  Task(4, "Understand where is the classroom", true,
      faker.date.dateTime(minYear: 2022, maxYear: 2100)),
  Task(5, "Learn Chinese", false,
      faker.date.dateTime(minYear: 2022, maxYear: 2100)),
  Task(
      6, "Go Outside", true, faker.date.dateTime(minYear: 2022, maxYear: 2100)),
  Task(7, "TD Slim", false, faker.date.dateTime(minYear: 2022, maxYear: 2100)),
  Task(8, "TOIEC English", false,
      faker.date.dateTime(minYear: 2022, maxYear: 2100)),
  Task(9, "Sleep at least once by week", true,
      faker.date.dateTime(minYear: 2022, maxYear: 2100)),
  Task(10, "Work 'til 2am", true,
      faker.date.dateTime(minYear: 2022, maxYear: 2100)),
  Task(11, "Go to the Docotr", true,
      faker.date.dateTime(minYear: 2022, maxYear: 2100)),
  Task(
      12, "Get Covid", true, faker.date.dateTime(minYear: 2022, maxYear: 2100)),
  Task(13, "Get a new computer", false,
      faker.date.dateTime(minYear: 2022, maxYear: 2100)),
  Task(14, "Get a trainee", false,
      faker.date.dateTime(minYear: 2022, maxYear: 2100)),
  Task(15, "Find a to do idea", false,
      faker.date.dateTime(minYear: 2022, maxYear: 2100)),
];

// List<Task> tasks_api = [

// ]

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
